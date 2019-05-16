x=-sqrt(100);
y=sqrt(100);
dir = 1;   %kierunek 1 prawo 2 w lewo
xD = pi: pi/100 : 2*pi;
a=sqrt(101)*cos(xD);
b=sqrt(101)*sin(xD)-0.2+sqrt(100);
V=VideoWriter('myFile','Archival');
open(V);
t=-0.1; %tarcie
h = y; %wysokosc startowa
dx = 0.5; %wielkoœæ kroku




while(true)
    
    
    if dir == 1
     
      plot (a,b,x,y,'o');
      axis([-11,11,-11,11]);
      writeVideo(V,getframe);
      x=x+dx;
      y=-sqrt(100-x^2)+sqrt(100);
      alfa=atan(y/abs(x));
      h0=(h+(t*h*sqrt(2)))/(1-(t/sin(alfa)));
      
       if y>=h0 && x>0
          
           h=h0;
           if h<0.05
               break;
           end
       dir=2;
       end
    else 
     
      plot (a,b,x,y,'o');
      axis([-11,11,-11,11]);
      writeVideo(V,getframe);
      x=x-dx;
      y=-sqrt(100-x^2)+sqrt(100);
      alfa=atan(y/abs(x));
      h0=(h+(t*h*sqrt(2)))/(1-(t/sin(alfa)));
      
       if y>=h0 && x<0
          
           h=h0;
           if h<0.05
               break;
           end
        dir=1;
       end
    end
    
   
  
end

plot (a,b,0,0,'o');
axis([-11,11,-11,11]);
writeVideo(V,getframe);

close(V);