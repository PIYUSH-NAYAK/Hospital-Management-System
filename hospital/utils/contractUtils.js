// utils/contractUtils.js

import web3 from "./web3";

// Add ABI and Contract Address for the Hospital and Appointment contracts
import HospitalABI from "../contracts/Hospital.json";
import AppointmentABI from "../contracts/Appointment.json";

// Set the contract address (replace with your deployed contract address)
const HOSPITAL_CONTRACT_ADDRESS = "0xYourHospitalContractAddress";
const APPOINTMENT_CONTRACT_ADDRESS = "0xYourAppointmentContractAddress";

// Get the contract instance
export const getHospitalContract = () => {
  return new web3.eth.Contract(HospitalABI, HOSPITAL_CONTRACT_ADDRESS);
};

export const getAppointmentContract = () => {
  return new web3.eth.Contract(AppointmentABI, APPOINTMENT_CONTRACT_ADDRESS);
};

// Helper function to get the current account
export const getAccount = async () => {
  const accounts = await web3.eth.getAccounts();
  return accounts[0];
};
