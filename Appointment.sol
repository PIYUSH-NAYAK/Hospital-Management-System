// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HospitalManagement {
    struct Patient {
        bool exists;
        string name;
        uint age;
        string medicalHistory;
    }

    struct Appointment {
        address patientAddress;
        uint appointmentTime;
        string reason;
        bool confirmed;
    }

    mapping(address => Patient) public patients;
    Appointment[] public appointments; // List of all appointments

    address public doctor; // Single doctor (physician)

    modifier onlyDoctor() {
        require(msg.sender == doctor, "Only the doctor can perform this action");
        _;
    }

    constructor(address _doctorAddress) {
        doctor = _doctorAddress; // Set the doctor's address during deployment
    }

    // Register patient
    function registerPatient(string memory _name, uint _age, string memory _medicalHistory) public {
        patients[msg.sender] = Patient(true, _name, _age, _medicalHistory);
    }

    // Book appointment
    function bookAppointment(uint _appointmentTime, string memory _reason) public {
        require(patients[msg.sender].exists, "Patient not registered");
        require(_appointmentTime > block.timestamp, "Appointment time must be in the future");

        appointments.push(Appointment({
            patientAddress: msg.sender,
            appointmentTime: _appointmentTime,
            reason: _reason,
            confirmed: false
        }));
    }

    // Respond to appointment
    function respondToAppointment(uint _appointmentIndex, bool _confirm) public onlyDoctor {
        require(_appointmentIndex < appointments.length, "Invalid appointment index");

        Appointment storage appointment = appointments[_appointmentIndex];
        appointment.confirmed = _confirm;

        if (_confirm) {
            emit AppointmentConfirmed(appointment.patientAddress, appointment.appointmentTime);
        } else {
            emit AppointmentRejected(appointment.patientAddress, appointment.appointmentTime);
        }
    }

    // Get all appointments for the doctor
    function getAppointments() public view returns (Appointment[] memory) {
        return appointments;
    }

    // Events
    event AppointmentConfirmed(address patientAddress, uint appointmentTime);
    event AppointmentRejected(address patientAddress, uint appointmentTime);
}
