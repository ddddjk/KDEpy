function  out=fixed_point(t,N,I,a2)
% this implements the function t-zeta*gamma^[l](t)

% t = z in algorithm, start with epsilon
% N = number of uniue data points (or simply data points ? ) iid normal
% I = [1:grid_points-1]'.^2; (grid_points == n)
% a2 = a=dct1d(initial_data);,     a2=(a(2:end)/2).^2;
l=7;
f= 2 * pi^ (2*l) *sum(I.^l.*a2.*exp(-I*pi^2*t))

% setting l=7 corresponds to [6, 5, 4, 3, 2] in the loop below,
% which are the 5 iterations in the paper
for s=l-1:-1:2
    % s is like j in the paper
    % [1:2:2*s-1] = the first s odd numbers
    %prod([1:2:2*s-1])
    %sqrt(2*pi) 
    K0=prod([1:2:2*s-1])/sqrt(2*pi) ;
    const=(1+(1/2) ^ (s+1/2))/3;
    time=(2*const*K0/(N * f)) ^ (2/(3+2*s)); 
    f=2*pi^(2*s)*sum(I.^s.*a2.*exp(-I*pi^2*time))

end
out=t-(2*N*sqrt(pi)*f)^(-2/5);
end
