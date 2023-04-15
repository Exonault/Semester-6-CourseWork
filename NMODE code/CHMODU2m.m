% matrichna eksponenta, vtora kursova
A = [0,1;-16,0];
B = [0;1];
y = [0;0]; % nachalni usloviq
h = 0.1; % stupka
n = 100; % broi iteracii
x1 = 0; x(1)=0; y1(1)=0; y2(1)=0;
A2=expm(A*h); % smqta se exp(A*delta T)
for i=2:n
    y=A2*y+(h/2)*(A2*B+B*sin(4*(x1+h))); % formula nekva
     y1(i)=y(1); y2(i)=y(2);
    x1 = x1+h; x(i)=x1;
end
figure(1), plot(x,y1,'r',x,y2,'b');
