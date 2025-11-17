function results = cvx_opf_sdr(net)
% 3-bus AC-OPF SDR with CVX.

nbus   = net.nbus;
Y      = net.Y;
sd     = net.sd;
Cg     = net.Cg;
Pg_min = net.Pg_min;
Pg_max = net.Pg_max;
Qg_min = net.Qg_min;
Qg_max = net.Qg_max;
Vmin   = net.Vmin;
Vmax   = net.Vmax;
a      = net.a;
b      = net.b;
c      = net.c;
ng     = net.ng;

cvx_begin sdp
    cvx_precision medium

    variables Pg(ng) Qg(ng)
    variable  W(nbus,nbus) complex

    minimize( sum( a.*(Pg.^2) + b.*Pg + c ) )

    subject to
        W == hermitian_semidefinite(nbus);

        Vmin^2 <= real(diag(W)) <= Vmax^2;

        Pg_min <= Pg <= Pg_max;
        Qg_min <= Qg <= Qg_max;

        s_g   = Cg*(Pg + 1j*Qg);
        s_inj = s_g - sd;

        for i = 1:nbus
            s_inj(i) == conj(Y(i,:)) * W(i,:).';
        end

cvx_end

results.Pg     = Pg;
results.Qg     = Qg;
results.W      = W;
results.status = cvx_status;
results.cost   = cvx_optval;

end
