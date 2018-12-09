function Ic = untitled5(r1,r2,vcc,Icguess,beta,Is,vt)
vthev = (r2/(r1+r2))*vcc;
rthev = ((1/r1)+(1/r2))^-1;
Ic = Icguess;
disp([vthev])
disp(rthev)

%brute force search for zero
err = @(x) x - Is*exp(((vthev - (x/beta)*rthev))/vt);
step = 1e0;
while(step>1e-12)
   while(err(Ic)>0) 
       Ic = Ic - step;
       disp(Ic)
   end
   step = step / 2;
   while(err(Ic)<0)
      Ic = Ic + step; 
      disp(Ic)
      
   end
   step = step/2;
end
disp(Ic)
disp(err(Ic))


% while abs(Ic - Is*exp(((vthev - (Ic/beta)*rthev))/vt)) > 10^-40 && Ic ~= 0
%     Ib = Ic/beta;
%     x = Ic - Is*exp((vthev - (Ic/beta)*rthev)/vt);
%     y = 1-((Is*rthev)/(beta*vt))*exp((vthev -(Ic/beta)*rthev)/vt);
%     
%     disp([Ic x y]);
%     Ic = Ic - (x/y);
%     
% end
% 
