// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Hospital {
    // Define a struct for Patient data
    struct Patient {
        string name;
        uint age;
        string medicalHistory;
        address patientAddress;
        bool exists; // Check if patient is registered
    }

    // Define a struct for Doctor data
    struct Doctor {
        string name;
        string specialization;
        
        address doctorAddress;
        bool exists; // Check if doctor is registered
    }

    // Mappings to store patients and doctors
    mapping(address => Patient) public patients;
    mapping(address => Doctor) public doctors;

    // Modifier to restrict access to registered patients
    modifier onlyPatient() {
        require(patients[msg.sender].exists, "Only registered patients can call this function.");
        _;
    }

    // Modifier to restrict access to registered doctors
    modifier onlyDoctor() {
        require(doctors[msg.sender].exists, "Only registered doctors can call this function.");
        _;
    }

    // Function to register a new patient
    function registerPatient(string memory _name, uint _age, string memory _medicalHistory) public {
        require(!patients[msg.sender].exists, "Patient already registered.");
        
        patients[msg.sender] = Patient({
            name: _name,
            age: _age,
            medicalHistory: _medicalHistory,
            patientAddress: msg.sender,
            exists: true
        });
    }

    // Function to register a new doctor
    function registerDoctor(string memory _name, string memory _specialization) public {
        require(!doctors[msg.sender].exists, "Doctor already registered.");
        
        doctors[msg.sender] = Doctor({
            name: _name,
            specialization: _specialization,
            doctorAddress: msg.sender,
            exists: true
        });
    }
}
