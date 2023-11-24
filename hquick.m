function [y3] = hquick(deltaT,tempo,aux,cinj,cini,newVet,oldVet,divEspaco,vetorEspaco,deltaTMAX,C,thetaVet)
tic
clear
clc
entradaDados
TempoProcessamento = 0;
 g =2;
while aux < tempo 
      if (aux>tempo/2)
          cini = cinj;
      end

   
    newVet(1) = oldVet(1) - (C)*(2*(oldVet(1)-cini)); %Contorno Esquerdo
    thetaVet(1) = oldVet(1) - (C)*(2*(oldVet(1)-cini)); %Contorno Esquerdo
    for j = 2:divEspaco-1
       while g < length(oldVet)
           if (oldVet(g) ~= oldVet(g+1))
               thetaVet(g) = (oldVet(g)-oldVet(g-1))/(oldVet(g+1)-oldVet(g));
              % thetamod(g) = 90;
               

            else
               %thetamod(g) = 91
                thetaVet(g) = (oldVet(g)-oldVet(g-1))/(oldVet(j+1)*0.000009-oldVet(j))
                
            %    thetamod(j) = (oldVet(j)-oldVet(j-1))/(oldVet(j+1)-oldVet(j));
               
            end
          g = g+1;
        end
%         if (oldVet(j) ~= oldVet(j+1))
%            % thetamod(j) = (oldVet(j)-oldVet(j-1))/(oldVet(j+1)-oldVet(j));
%            thetamod(j) = 10
%            break
%         else
%             thetamod(j) = 2
%             
%         end
        


        
      %  thetamod(j) = (oldVet(j)-oldVet(j-1))/(oldVet(j+1)-oldVet(j))
        newVet(j) = oldVet(j) - (C)*(oldVet(j) - oldVet(j - 1)) -(C)/(2) *(1-C)*((psiHquick(thetaVet(j+1)))*(oldVet(j+1)-oldVet(j))-(psiHquick(thetaVet(j-1)))*(oldVet(j)-oldVet(j-1)));

    end
    oldVet=newVet;
    aux = aux + deltaT;
    newVet(divEspaco) = oldVet(divEspaco) - (C)*(oldVet(divEspaco) - oldVet(divEspaco-1)); %Contorno Direito
    %thetamod(divEspaco) = oldVet(divEspaco) - (C)*(oldVet(divEspaco) - oldVet(divEspaco-1))
end
    
    for k =1:divEspaco
        y3(k) = newVet(k);
    end
plot(vetorEspaco, newVet,'r');
title("Equação de Advecção-Difusão FTBS");
grid on
hold on
texto_anotacao = sprintf('DeltaT: %.3f\nDeltaTMAX: %.3f', deltaT, deltaTMAX);
annotation('textbox',[0.63,0.2,0.2,0.7] ,'String',texto_anotacao,'FitBoxToText','on');
xlabel("Lx");
ylabel("Concentração");


%Plot sem anotacao para varios graficos (Necessario ir mudando a cor
%manualmente e os parametros no arquivo novaEntradaDados.m manualmente
%e comentar o plot de cima

% plot(vetorEspaco, newVet,'g');
% title("Equação de Advecção-Difusão FTBS");
% grid on
% hold on
% xlabel("Lx");
% ylabel("Concentração");



TempoProcessamento = toc
end