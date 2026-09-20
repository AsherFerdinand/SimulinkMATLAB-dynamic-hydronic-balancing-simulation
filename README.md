# Simulink Model – Boiler with Valve Control for Two Rooms (Relay/Algebraic Loop Issue)

This repository contains a Simulink model simulating a **boiler heating system** with **two temperature-controlled zones (rooms)**. Each room has a **valve** that regulates the flow of thermal liquid, controlled by a **Relay block** based on the room's temperature.

---

## ❗ Problem Description

The model uses **two Relay blocks** (one per room) to control the opening and closing of valves depending on each room's temperature.

This setup leads to:

- An **algebraic loop** warning/error due to direct feedthrough in the Relay blocks.
- **Simulation instability**, **discontinuities**, or **solver failures**.

I'm looking for a solution to preserve the switching logic while maintaining simulation stability.

---

## 🧠 What I'm Trying to Do

- Simulate a **boiler system** with **2 separate heating zones**.
- Use Relay blocks to **open/close valves** based on each room’s temperature.
- Accurately model the control dynamics without algebraic loops.




