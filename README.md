# Numerical Methods for Differential Equations II

## UERJ 2023.2 - Professor Grazione Souza.

- Advection-Diffusion Equation
- Comparison of Methods applied to the Advection Equation
- Forward Time-Backward Space (FTBS)
- Van Leer
- HQUICK
- Superbee
- Inviscid Burgers equation in non-conservative and conservative methods

The objective of this work is to codify different numerical methods based on finite volume discretizations in solving the advection equation. Tests with parameter changes are also carried out in this project to compare the results.

## How to use

### entradaDados.m

use the entradaDados.m file to modify with the parameters of your desired problem.
### main.m

the main.m file can be used with the condition of commenting the lines of the methods that will not calculate. The program only calculates 1 method at a time.

### interface.m

If you choose to use the program's graphical interface, run the interface.m file. By way of comparison, the graph plotted in the interface is not subscribed, you can run different methods and analyze the difference on the same plot.

Please note that both when choosing to execute via main.m or via the graphical interface, the parameters used in the calculation are the same as those in the entradaDados.m file.