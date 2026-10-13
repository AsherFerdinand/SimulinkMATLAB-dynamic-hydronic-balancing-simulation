<div align="center">

# 🏠 Centralized Temperature Control of a Hydronic Heating System

### Dynamic Simulation & Coordinated Room-Temperature Control in a Multifamily Building

---

**BACHELOR THESIS · MECHANICAL ENGINEERING**

**Technische Hochschule Ingolstadt · 2025**

**Author:** Ferdinand Yurichson

---

![MATLAB](https://img.shields.io/badge/MATLAB-Simulation-orange?logo=mathworks)
![Simulink](https://img.shields.io/badge/Simulink-Modelling-blue?logo=mathworks)
![Simscape](https://img.shields.io/badge/Simscape-Thermal%20Systems-green)
![Thesis](https://img.shields.io/badge/Academic-Bachelor%20Thesis-purple)

</div>

---

## 🔗 Project Navigation

| 📄 Thesis Document | 🏗️ Simulink Model |
|:---:|:---:|
| [**Read Thesis PDF**](01_Thesis/thesis.pdf) | [**Open Main Model**](02_Model/main_model.slx) |
| Complete academic documentation | Building and hydronic heating model |

| 🎛️ Control Logic | 📊 Simulation Results |
|:---:|:---:|
| [**View Controller**](03_Control/central_control_logic.m) | [**Explore Results**](05_Results/README.md) |
| Centralized supervisory control | Plots and performance comparisons |

---

## 🧭 Project Overview

This project investigates whether a centralized supervisory controller can
improve the uniformity of room warm-up in a multifamily building equipped
with a hydronic heating system.

| 🏢 Building | 🌡️ Initial Temperature | 🎯 Target Temperature |
|:---:|:---:|:---:|
| 3 storeys · 6 units · 36 rooms | Approximately 5°C | 20°C |

---

# 🏗️ Simulink Model Architecture

This section presents the main subsystems of the MATLAB/Simulink model,
from the complete building simulation to the hydronic network and
centralized temperature-control logic.

## 1. Overall Simulink Model

| Overall System Model | Description |
|:---:|---|
| <img src="https://github.com/user-attachments/assets/0e57115a-70be-4147-b058-35b25b06178c" width="1500" />| Complete simulation architecture integrating the building thermal model, hydronic heating network, radiator branches and room-temperature control. |

## 2. Hydronic Heating Network

| Hydronic Network | Description |
|:---:|---|
| <img width="942" height="750" alt="image" src="https://github.com/user-attachments/assets/1ef7db60-d23a-47c7-969a-d3cb70cb1286" />| Heat source, hot-water storage, circulation pump, distribution pipes, radiator branches and valves. |
|<img width="858" height="496" alt="image" src="https://github.com/user-attachments/assets/771f76fb-459b-4481-ae8e-d1ff1bcd246c" />| : Control system for boiler operation |
|<img width="874" height="379" alt="image" src="https://github.com/user-attachments/assets/ceed6f5c-23cf-481b-93db-0cc0a1c52d1f" />|Circulation pump subsystem with connections|

## 3. Building Thermal Model

| Building and Room Model | Description |
|:---:|---|
| <img  src="https://github.com/user-attachments/assets/018cbdea-ba28-49cb-b85b-cc754096e80b" width="1500" />| Thermal representation of the rooms, heat losses to the outdoor environment, heat exchange between neighbouring rooms and radiator heat input. |
| **Building:** 36 rooms across 3 storeys | **Purpose:** Simulate room-temperature dynamics during warm-up. |
| <img width="928" src="https://github.com/user-attachments/assets/bdc81934-9438-4044-8c44-8f4e7ce9a501" />| Internal heat transfer between rooms, atmosphere and radiator. |
| <img width="922" height="411" alt="image" src="https://github.com/user-attachments/assets/92e7bfb5-a212-4714-9208-dda5889b7352" />| Subsystem of valve control and radiator unit. |

## 4. Centralized Control Logic

| Supervisory Controller | Description |
|:---:|---|
|<img width="880" height="743" alt="image" src="https://github.com/user-attachments/assets/03eecfcb-1f7b-4369-a2d0-9f9fca4d0b2c" />| Central controller using room-temperature information to coordinate radiator-valve operation alongside local thermostats. |
| **File:** `03_Control/central_control_logic.m` | **Purpose:** Improve the synchronization of room warm-up. |

## 5. Simulation Results

| Room Temperature Response | Warm-Up Comparison |
|:---:|:---:|
| ![Room Temperature Response](05_Results/figures/room_temperature_response.png) | ![Warm-Up Comparison](05_Results/figures/warmup_comparison.png) |
| Temperature trajectories over simulation time | Comparison of warm-up performance across control strategies |

---

## 🎛️ Control Scenarios

| Scenario | Control Strategy | Objective |
|:---|:---|:---|
| **Case 1** | Baseline | Establish the reference heating response. |
| **Case 2** | Local thermostats | Evaluate independent room-temperature regulation. |
| **Case 3** | Centralized control | Evaluate coordinated radiator-valve operation. |

---

## 📊 Key Performance Indicators

| Metric | Definition |
|:---|:---|
| Earliest warm-up time | First room reaching 20°C |
| Latest warm-up time | Last room reaching 20°C |
| Warm-up-time spread | Latest time − earliest time |
| Maximum room-temperature spread | Largest simultaneous difference between room temperatures |

The primary objective is to determine whether centralized control reduces
the warm-up-time spread compared with independent local thermostats.

> **Note:** All figures and quantitative results should come from the actual
> MATLAB/Simulink simulations. Replace placeholder images with exported
> model screenshots and measured results before publication.
