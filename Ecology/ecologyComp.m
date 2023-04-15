function ecologyComp
% Параметри на системата
% a = 1;b = 8;sigma = 0.2;
% c = 3;nu = 0.3;d = 7;
% N0 = [2; 2];
%     ecologyCompGraph(a,b,sigma,c,nu,d,N0,1)
% a = 10;b = 0.1;sigma = 0.9;
% c = 9;nu = 0.3;d = 0.7;
% N0 = [1; 1];
%     ecologyCompGraph(a,b,sigma,c,nu,d,N0,2)
end

function ecologyCompGraph(a,b,sigma,c,nu,d,N0,i)
% Дефиниране на началните условия и интервала на времето
tspan = [0 100];

% Дефиниране на функцията, която описва системата
ode = @(t, N) [ (a - b*N(1) - sigma*N(2)) * N(1);
                (c - nu*N(1) - d*N(2)) * N(2)];

% Решаване на системата от диференциални уравнения
[t, N] = ode45(ode, tspan, N0);

% Визуализация на резултатите
figure(i),plot(t, N(:,1), 'r-', t, N(:,2), 'b--');
legend('N_1', 'N_2', 'Location' , 'best');
xlabel('Time');
ylabel('Population');
end

