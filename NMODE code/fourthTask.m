function fourthTask
fourthTask1
%fourthTask2
fourthTask3
end


function fourthTask1
x0=0;
x0=fsolve(@function1,x0);
y0=[0.5,x0];
[t,y]=ode45(@function2,[0,1],y0);
figure(1),plot(t,y(:,1),t,y(:,2),'r')
end

function f=function1(x)
y0=[0.5,x];
[t,y]=ode45(@function2,[0,1],y0);
n=length(t);
f=y(n,1)-0.3;
end

function dy=function2(t,y)
dy(1,1)=y(2);
dy(2,1)=3*y(1)+10*y(1)^2+t^2;
end

function fourthTask2
x0=0;
x0=fsolve(@function1a,x0);
y0=[0.5,x0];
[t,y]=ode45(@function2a,[0,1],y0);
figure(2),plot(t,y(:,1),t,y(:,2),'r')
end

function f=function1a(x)
y0=[0.5,x];
[t,y]=ode45(@function2a,[0,1],y0);
n=length(t);
f=y(n,1)-0.3;
end

function dy=function2a(t,y)
dy(1,1)=y(2);
dy(2,1)=3*y(1)+10*y(1)^2+t^2;
end

% функцията, описваща уравнението
function dxdt = f(t, x)
    dxdt = [x(2); -1/t*x(2) - 16/t^2*x(1) + sin(1/t^2)];
end

% метод на Рунге-Кута за решаване на уравнението
function [t, x] = rk4(f, tspan, x0, h)
    t = tspan(1):h:tspan(2);
    x = zeros(length(x0), length(t));
    x(:,1) = x0;
    for i = 1:length(t)-1
        k1 = f(t(i), x(:,i));
        k2 = f(t(i)+h/2, x(:,i)+h/2*k1);
        k3 = f(t(i)+h/2, x(:,i)+h/2*k2);
        k4 = f(t(i)+h, x(:,i)+h*k3);
        x(:,i+1) = x(:,i) + h/6*(k1+2*k2+2*k3+k4);
    end
end

% функцията, която стреля за намиране на граничната стойност
function y = shoot(p)
    tspan = [1, 4];
    x0 = [-0.3; p];
    h = 0.01;
    [~, x] = rk4(@f, tspan, x0, h);
    y = x(1,end) - 0.4;
end

% намиране на параметъра на стрелбата
function fourthTask3
a = -1;
b = 1;
tol = 1e-6;

while (b-a)/2 > tol
    p = (a+b)/2;
    if shoot(p)*shoot(a) < 0
        b = p;
    else
        a = p;
    end
end

% решаване на уравнението с намерения параметър на стрелбата
tspan = [1, 4];
x0 = [-0.3; p];
h = 0.01;
[t, x] = rk4(@f, tspan, x0, h);

% визуализация на решението
figure(3),plot(t, x(1,:),t, x(2,:))
xlabel('t')
ylabel('x(t)')
end



