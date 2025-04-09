# 2D Two-Phase Flow Simulator (Toy Code)

This repository contains a simplified two-phase flow solver for simulating the interaction between two immiscible fluids (such as air and water) in a 2D domain. **Note that this is a TOY CODE with limited capabilities intended for educational purposes only.**

## Overview

This code simulates two-phase incompressible flows using the Volume of Fluid (VOF) method on a staggered grid arrangement. It is capable of simulating basic fluid dynamics scenarios such as dam breaks, water column collapses, and rising/falling droplets.

## Numerical Methods and Schemes

### Spatial Discretization
- Staggered grid arrangement (Marker and Cell method)
- Finite difference approximations for spatial derivatives
- Second-order central differencing for diffusion terms
- Hybrid scheme for convection terms

### Temporal Discretization
- Fourth-order Runge-Kutta (RK4) method for momentum equations
- Explicit time stepping

### Pressure-Velocity Coupling
- Fractional step method (Projection method)
- Pressure Poisson equation solved using Successive Over-Relaxation (SOR)

### Interface Capturing Method
- Volume of Fluid (VOF) method for tracking the interface between fluids
- High Resolution Interface Capturing (HRIC) scheme with flux limiting for improved interface sharpness
- Courant number-dependent blending for stability at high velocities
- Local boundedness enforcement to prevent numerical oscillations

### Fluid Properties Treatment
- Density and viscosity are calculated based on VOF field using arithmetic averaging

## Sample Cases

The code can simulate four primary test cases:

### 1. Dam Break
Simulates the collapse of a water column contained by a virtual dam. When the simulation starts, the dam is instantaneously removed, and the water column collapses under gravity.

**Input parameters:**
- Water distance in X-Direction (Default 0.5)
- Water distance in Y-Direction (Default 0.3)

### 2. Water Column Collapse
Simulates the collapse of two separate water columns that eventually merge.

**Input parameters:**
- Water distance in X-Direction side 1 (Default 0.3)
- Water distance in Y-Direction side 1 (Default 0.3)
- Water distance in X-Direction side 2 (Default 0.7)
- Water distance in Y-Direction side 2 (Default 0.3)

### 3. Falling Water Drop
Simulates a water droplet falling into a pool of water.

**Input parameters:**
- Water drop radius (Default 0.05)
- X-Direction drop location (Default 0.5)
- Y-Direction drop location (Default 0.65)
- Water distance in Y-Direction (Default 0.5)

### 4. Rising Water Bubble
Simulates an air bubble rising through water due to buoyancy.

**Input parameters:**
- Air bubble radius (Default 0.05)
- X-Direction bubble location (Default 0.5)
- Y-Direction bubble location (Default 0.3)
- Water distance in Y-Direction (Default 0.5)

## Usage

1. Compile the code using a C++ compiler:
   ```
   g++ -o fluid_simulator CGflow_incompVOF.cpp
   ```

2. Run the executable:
   ```
   ./CGflow_incompVOF
   ```

3. Follow the prompts to input parameters:
   - Domain size (Lx, Ly)
   - Gravity components (gx, gy)
   - Fluid properties (densities and viscosities)
   - Numerical parameters (grid size, time step, etc.)
   - Simulation type (1-4 corresponding to the cases above)
   - Case-specific parameters

4. The simulation results are output as CSV files at regular intervals:
   - `density_field_XXXXX.csv` - Contains the density field data
   - `vof_field_XXXXX.csv` - Contains the VOF field data (interface location)

## Limitations

As this is a toy code, it has several limitations:

- Limited to 2D simulations
- Fixed rectangular domain with simple boundary conditions
- No turbulence modeling
- Limited numerical stability for high Reynolds number flows
- Basic VOF implementation without advanced interface reconstruction
- No surface tension effects
- Limited to two-phase flows only
- Simple linearized density and viscosity models
- No adaptive time stepping or grid refinement
- No parallelization for large-scale simulations
- No energy equation for non-isothermal flows
- Only supports simple geometries with no solid obstacles

## Physical Parameters

The default physical parameters are set for air-water systems:
- Air density: 0.001 (kg/m³)
- Water density: 1.0 (kg/m³)
- Air viscosity: 0.00001855 (Pa·s)
- Water viscosity: 0.00089 (Pa·s)
- Gravity: -9.81 m/s² in the Y-direction

## Numerical Parameters

Default numerical parameters:
- Grid size: 102 x 102 points
- Time step: 0.00005 s
- Number of time steps: 5000
- Maximum inner iterations for pressure solver: 9000
- Maximum allowable error rate: 0.00001
- SOR relaxation parameter: 1.2

## Visualization

The CSV output files can be visualized using external tools such as ParaView, MATLAB, Octave, Python (with matplotlib), or similar visualization software. A file named "Readcsv.m" is shared in the folder which can be used to create and save scalar plots by reading the csv's.
