**Modelling of Radiators and Distribution Pipes**

The hydronic heating network is represented using Thermal Liquid Pipe components in Simscape. Radiators are modelled as heat-emitting pipe elements that transfer thermal energy from the circulating water to the associated room. This representation simplifies the geometry and heat-transfer behaviour of conventional radiators.

The distribution pipes connecting the heat source to the radiators are modelled using the same pipe component. To represent insulated pipes routed within walls or floor structures, heat transfer between these pipes and their surroundings is neglected by applying an ideal adiabatic boundary condition. This assumption simplifies the thermal network but does not represent the residual heat losses that may occur in real insulated pipes.

The pipe-based radiator representation and ideal insulation assumption are applied consistently across the simulated control scenarios. Consequently, the results are used primarily to compare the performance of the investigated control strategies under the adopted modelling assumptions.
