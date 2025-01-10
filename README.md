# 2024/11/22

# VHDL Project: 4-Bit Arithmetic Logic Unit (ALU)

This project implements a modular and hierarchical design of a 4-bit Arithmetic Logic Unit (ALU) using VHDL. The design was deployed on a Nexys-3 FPGA board, utilizing its functionality to demonstrate real-time arithmetic and logical operations.

---

## Table of Contents

1. [Introduction](#introduction)
2. [Features](#features)
3. [Modules and Functionality](#modules-and-functionality)
   - [Arithmetic Operations](#arithmetic-operations)
   - [Logical Operations](#logical-operations)
   - [Multiplexers](#multiplexers)
   - [Adders](#adders)
4. [Top-Level Design](#top-level-design)
5. [Testbench](#testbench)
6. [FPGA Implementation](#fpga-implementation)
7. [Usage](#usage)

---

## Introduction

The 4-bit ALU is a critical component in many digital systems, responsible for performing arithmetic and logical operations. This project is designed with modularity, readability, and extensibility in mind. Each module serves a distinct purpose, ensuring the design adheres to best practices in hardware description languages.

---

## Features

- **Arithmetic Operations**: Addition and subtraction are implemented using modular adders.
- **Logical Operations**: Bitwise AND, OR, XOR, and other logic operations are supported.
- **Multiplexers**: Efficiently route data based on control signals.
- **Hierarchy**: The design is split into multiple files for better maintainability.
- **Testbench**: A comprehensive testbench ensures correctness across all operations.

---

## Modules and Functionality

### Arithmetic Operations

#### `Full_Adder.vhd` and `Half_Adder.vhd`
- Implements basic building blocks for binary addition.
- **Half Adder**:
  - Takes two inputs and generates a sum and carry-out.
- **Full Adder**:
  - Takes three inputs (including carry-in) and generates a sum and carry-out.

#### `Arithmatic.vhd`
- Combines multiple adders to perform multi-bit arithmetic operations like addition and subtraction.
- Carries are propagated correctly across bits to ensure accurate results.

---

### Logical Operations

#### `LOGIC.vhd`
- Implements core logic operations:
  - **AND**
  - **OR**
  - **XOR**
  - **NOT**
- Each operation is controlled via specific control signals.

---

### Multiplexers

#### `MUX_TwoOne.vhd` and `MUX_FourOne.vhd`
- **Two-to-One Multiplexer**:
  - Routes one of two inputs to the output based on a single control signal.
- **Four-to-One Multiplexer**:
  - Routes one of four inputs to the output based on two control signals.
- Used to select between different operations in the ALU.

---

### Adders

#### `OneStage_ALU.vhd`
- A single stage of the ALU, combining arithmetic and logical operations at the bit level.
- Modular design allows chaining stages to form multi-bit ALUs.

#### `FourBit_ALU.vhd`
- Integrates four `OneStage_ALU` modules to form the complete 4-bit ALU.
- Handles control signals to select operations dynamically.

---

## Top-Level Design

#### `TopLevel.vhd`
- Combines all submodules into a single cohesive unit.
- Exposes input and output ports for:
  - 4-bit operands
  - Control signals
  - 4-bit result
  - Carry-out
- Ensures smooth integration between all components.

---

## Testbench

#### `TB.vhd`
- A comprehensive testbench designed to validate all functionalities of the ALU.
- Features:
  - Exhaustive testing of arithmetic and logical operations.
  - Randomized input generation for robustness testing.
  - Monitors and logs outputs for easy debugging.
- Simulated using tools like ModelSim or Vivado.

---

## FPGA Implementation

This project was successfully implemented on a **Nexys-3 FPGA board**, leveraging its switches, LEDs, and other peripherals to interact with the ALU in real time.

### Objectives

1. Validate the functionality of the 4-bit ALU in a hardware environment.
2. Provide real-time feedback using the board's onboard peripherals.
3. Demonstrate how control signals and inputs can be configured using switches.

### Hardware Mapping

- **Switches**: 
  - Used to provide the two 4-bit input operands and control signals.
  - Specific switches were assigned for each bit of the operands and operation selectors.
- **LEDs**:
  - Displayed the 4-bit output of the ALU.
  - Carry-out was shown on a separate LED.
- **Seven-Segment Displays**:
  - Configured to show the current operation being performed or the result in hexadecimal.

### Implementation Steps

1. **Synthesis**:
   - The VHDL design files were synthesized using Xilinx Vivado to generate a bitstream compatible with the Nexys-3 FPGA.
2. **Pin Assignment**:
   - Pins were mapped to the Nexys-3 board's switches, LEDs, and seven-segment display through the constraints file.
3. **Programming**:
   - The bitstream was loaded onto the Nexys-3 FPGA using a USB-JTAG connection.
4. **Real-Time Testing**:
   - Operands and control signals were set using the switches.
   - The results were observed on the LEDs, with additional debugging performed using the seven-segment display.

### Features Demonstrated

- **Addition and Subtraction**:
  - Adjusting the operand switches showed real-time addition/subtraction results on the LEDs.
- **Logical Operations**:
  - Operations such as AND, OR, and XOR were tested by toggling the operation selector switches.
- **Error Detection**:
  - Overflow in addition or subtraction was indicated using the carry-out LED.

### Challenges Faced

- **Timing Issues**:
  - Ensuring that switch debouncing did not affect the accuracy of the results.
- **Pin Mapping Conflicts**:
  - Careful attention was required to avoid conflicts in pin assignments.

### Tools and Software

- **Hardware**:
  - Nexys-3 FPGA board.
- **Software**:
  - Xilinx ISE for synthesis, simulation, and programming.
- **Simulation Tools**:
  - ModelSim for functional verification before deployment.

---

## Updated Usage

### Deploying on Nexys-3 FPGA

1. Synthesize the design using Xilinx Vivado to generate the `.bit` file.
2. Use the provided constraints file to map the pins to Nexys-3 FPGA switches and LEDs.
3. Program the FPGA using a USB-JTAG cable.
4. Test the ALU functionality by toggling switches and observing the outputs on LEDs and the seven-segment display.

---

## Usage

### Prerequisites

- **VHDL Simulation Tools**: ModelSim, Vivado, or GHDL.
- **Knowledge of Digital Logic**: Understanding of adders, multiplexers, and logic gates is recommended.

### Steps

1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo/vhdl-4bit-alu.git
   ```
2. Open the project in your VHDL simulation environment.
3. Compile the files in the following order:
   1. `Half_Adder.vhd`
   2. `Full_Adder.vhd`
   3. `Arithmatic.vhd`
   4. `LOGIC.vhd`
   5. `MUX_TwoOne.vhd`
   6. `MUX_FourOne.vhd`
   7. `OneStage_ALU.vhd`
   8. `FourBit_ALU.vhd`
   9. `TopLevel.vhd`
4. Run `TB.vhd` to simulate and verify the design.
5. Observe waveforms and logs to ensure correctness.
