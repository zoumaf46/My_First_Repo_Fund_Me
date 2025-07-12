# Fund Me - A Simple Smart Contract Course Project

## Project Overview

This project is a basic crowdfunding smart contract built using Solidity and Foundry. It allows users to send ETH to the contract and tracks how much each address contributed. Only the contract owner can withdraw the funds.

This project was created as part of a CYFRIN UPDRAFT course to practice smart contract development and learn how to use tools like Foundry and GitHub.

## What The Contract Does and Why It's Useful

- Accepts ETH from anyone who wants to fund the project.
- Records how much each funder sends.
- Restricts withdrawals to the contract owner only.

This kind of contract is useful to learn core concepts like:
- `payable` functions
- mapping addresses to values
- access control
- smart contract testing

## Getting Started Guide

To use or test this project locally:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/zoumaf46/My_First_Repo_Fund_Me.git
   cd My_First_Repo_Fund_Me
2. **Install Foundry:**
    If you haven't installed Foundry yet:
    ```bash
    curl -L https://foundry.paradigm.xyz 
    foundryup
3.  **Build the project:**
    ```bash
    forge build
3.  **Run tests:**
    ```bash
    forge test
## Contribution Guidelines
This project is open-source and built for educational purposes. Contributions are welcome!

To contribute:
- Fork the repo
- Create a new branch for your changes
- Submit a pull request
Feel free to open issues if you have questions or suggestions.