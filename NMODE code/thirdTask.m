function thirdTask
thirdTask1;
thirdTask2;
end


function thirdTask1
alpha=0;
betta=1;
h=0.01;
x=0:h:5;
n=length(x)-2;
for i=1:n
    if i~=1, a(i,i-1)= -x(i)^2+x(i)*h-1; end
    a(i,i) = 2*x(i)^2-h^2*sin(x(i));
    if i~=n, a(i,i+1)= -x(i)^2-x(i)*h-1; end
    f(i)=-h^2*cos(x(i));
end

f(1)= f(1)-alpha*(-x(i)^2+x(i)*h-1);
f(n)= f(n)-betta*(-x(n)^2-x(n)*h-1);
y=a\f';
yy=[alpha,y',betta];
figure(1), plot(x,yy)
end

function thirdTask2
% задаване на граничните условия
x0 = -0.3; % x(1) = -0.3
xN = 0.4; % x(4) = 0.4

% задаване на интервала и броят точки за дискретизация
a = 1;
b = 4;
N = 100; % избор на брой точки

% дискретизация на интервала
h = (b-a)/(N-1);
t = linspace(a, b, N);

% задаване на началните приближения
x = zeros(1, N);
x(1) = x0;
x(N) = xN;

% решаване на системата уравнения с метода на крайните разлики
for i = 2:N-1
    A = 1/h^2 + 1/(2*h*t(i));
    B = -2/h^2 - 16/t(i)^2;
    C = 1/h^2 - 1/( 2*h*t(i));
    F = sin(1/t(i)^2);
    
    x(i) = (-A*x(i-1) + (B*h^2 - 2)*x(i) - C*x(i+1) + h^2*F)/B;
end

% показване на резултатите
figure(2),plot(t, x);
xlabel('t');
ylabel('x');
title('Решение на граничната задача с метода на крайните разлики');
end