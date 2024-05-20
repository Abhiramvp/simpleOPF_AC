# A Simple Optimal Power Flow (OPF) in AC network


An optimal Power Flow (OPF) Problem in an AC network is a typical optimization problem. An OPF problem minimizes an objective (e.g., power generation cost, network power loss, etc), while satisfying the physical conditions of the power system network as the constraints. The constraints of an OPF problem are typically the power generation limits of each source, the predefined voltage bounds at each bus (aka nodes of the power network graph), the power flow limits in the lines (aka edges of the power network graph), bus reactive power injection bounds, etc. 

A simple OPF considers the network data in the form of all the relevant bounds on power, voltage, etc, and the network line impedances, and load demands at the buses, to find out the optimal power flow in the network, which corresponds to the minimum (aka optimal point) of the objective function considered.

Here, a semidefinite programming relaxation (SDR) technique to efficiently convert the nonlinear nonconvex problem into a tractable semidefinite program (SDP) form, which is a convex optimization problem, solved using a commercial solver.
A simple OPF is the prerequisite for any addition to an OPF problem making it complex, e.g., security-constrained, stability-constrained, robust optimization, etc.


## Basic OPF Formulation

### Objective
Minimize:
$$
f(x) = \sum_{i=1}^n c_i P_i
$$

### Constraints
Subject to:
$$
\begin{align*}
& \text{Power balance at each bus:} & P_i - \sum_{j=1}^n P_{ij} = 0 \\
& \text{Voltage magnitude limits:} & V_{min} \leq V_i \leq V_{max} \\
& \text{Generator limits:} & P_{min} \leq P_i \leq P_{max} \\
& \text{Line flow limits:} & P_{ij} \leq P_{ij}^{max}
\end{align*}
$$
