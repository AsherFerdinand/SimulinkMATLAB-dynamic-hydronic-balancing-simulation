# Project Overview

## 1. Project Description

This project investigates the dynamic simulation and centralized temperature control of a hydronic heating system in a real three-storey multifamily building containing six residential units and 36 rooms. The system is modelled in MATLAB/Simulink using Simscape components to represent the thermal behaviour of the building, the heating water network, and the heat transfer from radiators to individual rooms.

The main objective is to investigate whether a centralized supervisory controller, operating alongside local room thermostats, can improve the uniformity of room warm-up. In particular, the controller aims to reduce the difference between the times at which the rooms reach the target temperature of 20 degrees Celsius, including rooms at different distances from the heat source.

The project compares three control scenarios:

1. A baseline scenario without active room-temperature control.
2. A scenario with independent local thermostats.
3. A scenario combining local thermostats with centralized supervisory control.

The simulation results are used to evaluate the effectiveness of the proposed control strategy under the assumptions of the developed model.

The main contribution of the project is the investigation of coordinated, temperature-based heating control rather than formal hydraulic balancing. The model does not explicitly calculate hydraulic pressure losses or the resulting water-flow distribution required to assess hydraulic balancing in the engineering sense.

## 2. Building and Heating System Model

### 2.1 Building Model

The building consists of three storeys, six residential units, and 36 rooms. The thermal behaviour of each room is represented using room models or thermal circuits in Simulink.

The model accounts for the principal heat-transfer paths considered in the simulation:

- Heat exchange between each room and the outdoor environment.
- Heat exchange between adjacent rooms.
- Heat supplied by the radiator associated with each room.
- Heat transfer through relevant building structures, including walls, floors, ceilings, and the roof.

The model uses the building's geometry and room arrangement to represent its thermal zones. Room-specific thermal properties and heat-transfer parameters determine how individual rooms respond to heating and environmental conditions.

### 2.2 Heat Source and Water Distribution Network

A heat source and hot-water storage system are located in the basement. A circulation pump supplies heating water through the distribution network to the radiators throughout the building.

The distribution network is represented using Simscape Thermal Liquid Pipe components. Different pipe lengths are used to represent the physical routes between the heat source and the radiators, reflecting differences in the distances between rooms and the basement heating system.

The distribution pipes are assumed to be ideally insulated. Therefore, heat exchange between these pipes and their surroundings is neglected in the model. This is an idealized representation of insulated pipes routed within walls or floor structures; residual heat losses in real distribution pipes are not represented.

Although pipe lengths are included, the model does not explicitly calculate hydraulic pressure drops or the resulting water-flow distribution. Therefore, differences in room warm-up cannot automatically be attributed to hydraulic resistance or reduced water flow in longer pipes. Any effects of pipe length must arise from physical mechanisms actually represented by the configured pipe models.

### 2.3 Radiator Model

Each room is equipped with a radiator represented by a pipe-based thermal model. The circulating water transfers heat through the pipe surface to the associated room.

This approach provides a simplified representation of radiator heat emission. It does not reproduce every characteristic of a conventional radiator, such as its detailed geometry and the separate contributions of convection and thermal radiation, unless these effects are incorporated into the component configuration.

The radiator model is used consistently across the control scenarios so that the simulated cases can be compared under the same modelling assumptions.

### 2.4 Initial Conditions

The initial temperature of all rooms is set to approximately 5 degrees Celsius. The heating system is then activated to investigate the dynamic warm-up process from a common cold-start condition.

The target temperature for the initial warm-up comparison is 20 degrees Celsius. The principal objective is to determine whether coordinated valve operation can reduce the differences in warm-up time between rooms.

## 3. Control Strategy

The control system is developed in three stages to allow the performance of each strategy to be compared.

### 3.1 Scenario 1: Baseline Without Active Room-Temperature Control

The first scenario establishes a reference case for the building and heating system without active room-temperature control.

The system's thermal response is observed as heating is supplied to the rooms. This scenario provides a baseline for assessing room-temperature development, warm-up times, and differences in heating performance across the building.

### 3.2 Scenario 2: Independent Local Thermostats

In the second scenario, each room is equipped with a local thermostat that regulates its associated radiator valve.

The thermostat compares the measured room temperature with its target temperature. A two-point control logic with hysteresis is used to open or close the valve, reducing excessive switching when the room temperature is close to the setpoint.

Each thermostat operates independently. Consequently, the control decisions for one room are not coordinated with the temperature conditions of other rooms.

This scenario provides a reference for evaluating the benefits of adding centralized supervisory control to conventional local temperature regulation.

### 3.3 Scenario 3: Centralized Supervisory Control with Local Thermostats

The third scenario combines independent local thermostats with a centralized supervisory controller.

The centralized controller monitors room temperatures and coordinates radiator-valve operation according to the implemented control logic. Rooms that warm up more rapidly or become warmer relative to other rooms may have their valves restricted, allowing heating to be directed towards rooms that are still colder.

The supervisory controller operates alongside the local thermostats, which continue to regulate their respective rooms according to their temperature setpoints. The intended outcome is to improve the uniformity of room-temperature trajectories and reduce the difference between the times required for the rooms to reach 20 degrees Celsius.

The strategy is evaluated through simulation rather than assumed to be effective in advance. Its performance is assessed by comparing the resulting room temperatures and warm-up times with those obtained in the baseline and local-thermostat scenarios.

The controller's behaviour is determined by its implemented logic and the temperature information available to it. The project does not assume that the controller directly measures or calculates hydraulic pressure losses or individual radiator water-flow rates.

## 4. Simulation and Evaluation Methodology

The three scenarios are simulated using the same building model, initial room temperatures, heating-system configuration, and relevant parameter settings. This provides a consistent basis for comparing the control strategies.

The evaluation focuses on the following measures.

### 4.1 Room-Temperature Trajectories

Room temperatures are monitored throughout the simulation to examine the warm-up process and compare the response of rooms throughout the building.

The trajectories indicate how quickly rooms warm up and how uniformly their temperatures evolve under each control strategy.

### 4.2 Warm-Up Time

For each room, the warm-up time is defined as the elapsed time from the start of the simulation until the room first reaches 20 degrees Celsius.

The warm-up-time spread is calculated by subtracting the earliest room's warm-up time from the latest room's warm-up time.

In plain terms:

Warm-up-time spread = Latest room warm-up time - Earliest room warm-up time

A smaller value indicates more synchronized room warm-up. This measure is used to compare the effectiveness of the three control scenarios.

### 4.3 Room-Temperature Spread

The temperature spread across the rooms is evaluated throughout the simulation.

At each simulation time:

Room-temperature spread = Highest room temperature - Lowest room temperature

A smaller temperature spread indicates that the room temperatures are more similar at that particular time.

This measure provides additional information about heating uniformity before and during the period in which rooms approach the target temperature.

### 4.4 Valve Operation

Valve commands are examined to understand how local thermostats and centralized supervisory control influence radiator operation.

The analysis can include valve opening and closing patterns, switching frequency, and the coordination between rooms. These observations help identify whether improvements in warm-up uniformity are accompanied by undesirable control behaviour, such as excessive valve switching.

### 4.5 Interpretation of Results

The results are interpreted in relation to the assumptions and limitations of the simulation model.

The comparison can establish whether centralized temperature-based coordination improves room warm-up uniformity in the modelled building. However, because the hydraulic network is not evaluated through explicit pressure-drop and water-flow calculations, the results do not establish that the strategy achieves formal hydraulic balancing.

Likewise, effectiveness in the modelled building does not by itself establish performance in other apartment layouts. Such generalization would require additional simulations using alternative building configurations and, where relevant, different pipe parameters.

## 5. Scope and Limitations

The project focuses on dynamic thermal simulation and coordinated room-temperature control in a multifamily hydronic heating system.

The principal assumptions and limitations are as follows:

- The building is represented by a simplified thermal model with 36 rooms and the heat-transfer paths included in the Simulink implementation.
- Radiators are represented using pipe-based thermal models rather than detailed radiator models.
- Distribution pipes have different lengths but are assumed to be ideally insulated, so heat exchange between these pipes and their surroundings is neglected.
- Hydraulic pressure losses and the resulting water-flow distribution are not explicitly calculated.
- The effectiveness of the centralized controller is assessed under the implemented model assumptions and simulated operating conditions.
- Generalization to other building layouts or hydraulic configurations requires additional testing.

These assumptions enable a comparative investigation of the control strategies while defining the limits of the conclusions that can be drawn.

## 6. Expected Contribution

The project evaluates whether centralized supervisory control can improve the uniformity of room warm-up when combined with independent local thermostats.

The key performance objective is to reduce the difference between the earliest and latest rooms reaching 20 degrees Celsius while maintaining room-level temperature regulation through the local thermostats.

The experimental results indicate that the centralized strategy substantially reduces the spread in room warm-up times in the simulated building. This provides evidence that coordinated temperature-based valve control can improve warm-up synchronization under the conditions represented by the model.

The work contributes a simulation-based evaluation of coordinated heating control in a multi-room building. It also provides a foundation for future investigations incorporating explicit hydraulic modelling, more detailed radiator characteristics, alternative building configurations, and the evaluation of control performance under a wider range of operating conditions.

## 7. Summary

This project develops a MATLAB/Simulink model of a three-storey, 36-room multifamily building supplied by a basement hydronic heating system. Radiators and distribution pipes are represented using Simscape Thermal Liquid Pipe components. The radiators transfer heat to the rooms, while the distribution pipes are treated as ideally insulated.

Three control scenarios are compared: a baseline without active room-temperature control, independent local thermostats, and local thermostats combined with centralized supervisory control.

The centralized strategy coordinates valve operation based on room-temperature information to improve the uniformity of warm-up.

The results are evaluated using room-temperature trajectories, warm-up-time differences, room-temperature spread, and valve behaviour. The findings support the use of centralized temperature-based coordination to improve warm-up synchronization in the simulated building, within the assumptions and limitations of the implemented model.
