# A Simple Optimal Power Flow (OPF) in AC network

An optimal Power Flow (OPF) Problem in an AC network is a typical optimization problem. An OPF problem minimizes an objective (e.g., power generation cost, network power loss, etc), while satisfying the physical conditions of the power system network as the constraints. The constraints of an OPF problem are typically the power generation limits of each source, the predefined voltage bounds at each bus (aka nodes of the power network graph), the power flow limits in the lines (aka edges of the power network graph), bus reactive power injection bounds, etc. 

A simple OPF considers the network data in the form of all the relevant bounds on power, voltage, etc, and the network line impedances, and load demands at the buses, to find out the optimal power flow in the network, which corresponds to the minimum (aka optimal point) of the objective function considered.

Here, a semidefinite programming relaxation (SDR) technique to efficiently convert the nonlinear nonconvex problem into a tractable semidefinite program (SDP) form, which is a convex optimization problem, solved using a commercial solver.
A simple OPF is the prerequisite for any addition to an OPF problem making it complex, e.g., security-constrained, stability-constrained, robust optimization, etc.


$$
\begin{align}
&\mathrm{minimize} && \boldsymbol{h}_g(\mathbf{p}^g), \\ 
&\mathrm{subject~to} && \hat{\mathrm{C}}^{\top}(\mathbf{S}^g ) = \hat{\mathrm{D}}^{\top} (\mathrm{S}^d) + \mathrm{diag} \{\mathbf{v}\mathbf{v}^* \mathrm{Y}^* \}, \\ 
& && |\mathrm{diag} \mathrm{C} \mathbf{v} \mathbf{v}^* \mathrm{Y}^* | = \mathbf{f}, \\ 
& && (\mathbf{v}^{\min})^2 \leq { \mathbf{v}\mathbf{v}^*} \leq (\mathbf{v}^{\max})^2, \\ 
& && \mathbf{p}^{g,\min} \leq \mathbf{p}^g \leq \mathbf{p}^{g,\max}, \\ 
& && \mathbf{q}^{g,\min} \leq \mathbf{q}^g \leq \mathbf{q}^{g,\max}, \\ 
& && -\mathbf{f}^{\max} \leq \mathbf{f} \leq \mathbf{f}^{\max}, \\ 
& && \angle \boldsymbol{v}_1 = 0, \\ 
&\mathrm{variables} && \mathbf{p}^g \in \mathbb{R}^{|\mathcal{N}|}; \mathbf{q}^g \in \mathbb{R}^{|\mathcal{N}|}; \mathbf{v} \in \mathbb{R}^{|\mathcal{N}|}; \mathbf{f} \in \mathbb{C}^{|\mathcal{E}|}; 
\end{align}
$$
