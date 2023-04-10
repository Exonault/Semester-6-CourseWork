function ecologyComp
ecologyCompN1ChangeA
end

function ecologyCompN1ChangeA
% Параметри на системата
a = 1;
b = 0.1;
sigma = 0.2;
c = 0.8;
d = 0.1;
nu = 0.3;

% Дефиниране на функцията, която описва системата
ode = @(t, N) [ (a - b*N(1) - sigma*N(2)) * N(1);
                (c - nu*N(1) - d*N(2)) * N(2)];

% Дефиниране на началните условия и интервала на времето
N0 = [0.5; 0.5];
tspan = [0 10];

% Решаване на системата от диференциални уравнения
[t, N] = ode45(ode, tspan, N0);

% Визуализация на резултатите
plot(t, N(:,1), 'r-', t, N(:,2), 'b--');
legend('N_1', 'N_2');
xlabel('Time');
ylabel('Population');

end
