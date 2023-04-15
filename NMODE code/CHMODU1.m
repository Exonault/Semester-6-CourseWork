function main
    h=pi/10;
    x=0:h:2*10;
    n=length (x);
    v=sin(x);
    y (1,1)=0; y (2,1) = 0.33;
    for k=1:(n-1)
        kl=h*rung (x(k), y(1:2,k)); 
        k2=h*rung (x(k) +h/2, y(1:2, k) + kl/2); 
        k3=h*rung (x (k) +h/2, y(1:2, k) + k2/2);
        k4=h*rung (x(k) +h, y(1:2, k) +k3); 
    y(1:2, k+1)=y(1:2, k) + (kl+2*k2+2*k3+k4)/6;
    end
    figure (1), plot (x,y (1, :), '*',x,y(2,:));
    figure (2), plot (x,y (1, :), '*',x,v);

function f = rung (x, y)
    f(1,1)=y(2);
    f(2,1)=-0.02*x*y(2)-y(1);