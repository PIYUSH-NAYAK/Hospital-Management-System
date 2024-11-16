// pages/index.js
import { useState } from "react";
import { getHospitalContract, getAccount } from "../utils/contractUtils";
import HospitalABI from "../contracts/Hospital.json"; // Contract ABI

export default function Home() {
  const [name, setName] = useState("");
  const [age, setAge] = useState("");
  const [condition, setCondition] = useState("");
  const [message, setMessage] = useState("");

  // Register a patient
  const registerPatient = async () => {
    const account = await getAccount();
    const hospitalContract = getHospitalContract();
    
    try {
      // Calling the smart contract function
      await hospitalContract.methods
        .registerPatient(account, name, age, condition)
        .send({ from: account });
      setMessage("Patient registered successfully!");
    } catch (error) {
      console.error(error);
      setMessage("Error registering patient.");
    }
  };

  return (
    <div>
      <h1>Hospital Management System</h1>
      <h2>Register Patient</h2>
      <input
        type="text"
        placeholder="Name"
        onChange={(e) => setName(e.target.value)}
      />
      <input
        type="number"
        placeholder="Age"
        onChange={(e) => setAge(e.target.value)}
      />
      <input
        type="text"
        placeholder="Condition"
        onChange={(e) => setCondition(e.target.value)}
      />
      <button onClick={registerPatient}>Register Patient</button>
      <p>{message}</p>
    </div>
  );
}
