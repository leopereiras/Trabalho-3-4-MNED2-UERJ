function [y2] = vanleer(deltaT,tempo,aux,cinj,cini,newVet,oldVet,divEspaco,vetorEspaco,C,thetaVet,psiVanleer)
tic
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
           else
                thetaVet(g) = (oldVet(g)-oldVet(g-1))/(oldVet(j+1)*0.000009-oldVet(j)); % Garantindo que nao sera /0          
            end
          g = g+1;
       end
        newVet(j) = oldVet(j) - (C)*(oldVet(j) - oldVet(j - 1)) -(C)/(2) *(1-C)*((psiVanleer(thetaVet(j+1)))*(oldVet(j+1)-oldVet(j))-(psiVanleer(thetaVet(j-1)))*(oldVet(j)-oldVet(j-1)));

    end
    oldVet=newVet;
    aux = aux + deltaT;
    newVet(divEspaco) = oldVet(divEspaco) - (C)*(oldVet(divEspaco) - oldVet(divEspaco-1)); %Contorno Direito
    thetaVet(divEspaco) = oldVet(divEspaco) - (C)*(oldVet(divEspaco) - oldVet(divEspaco-1));
end
    
    for k =1:divEspaco
        y2(k) = newVet(k);
    end
plot(vetorEspaco, newVet,'r');
title("Equação de Advecção-Difusão van Leer");
grid on
hold on
texto_anotacao = sprintf('DeltaT: %.3f', deltaT);
annotation('textbox',[0.63,0.2,0.2,0.7] ,'String',texto_anotacao,'FitBoxToText','on');
xlabel("Lx");
ylabel("Concentração");


%Plot sem anotacao para varios graficos (Necessario ir mudando a cor
%manualmente e os parametros no arquivo novaEntradaDados.m manualmente
%e comentar o plot de cima

% plot(vetorEspaco, newVet,'g');
% title("Equação de Advecção-Difusão van Leer");
% grid on
% hold on
% xlabel("Lx");
% ylabel("Concentração");



TempoProcessamento = toc
end