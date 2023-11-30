function [y5] = burgersConservativa(deltaTB,deltaX,tempo,aux,cinj,cini,newVet,oldVet,divEspaco,vetorEspaco,C)
tic
entradaDados
TempoProcessamento = 0;
while aux < tempo
      if (aux>tempo/2)
          cini = cinj;
     end
    newVet(1) = oldVet(1) - (C)*(2*(oldVet(1)-cini)); %Contorno Esquerdo
    for j = 2:divEspaco-1
        newVet(j) = (oldVet(j) - (deltaTB/deltaX)*((1/2)*(oldVet(j)^2) - (1/2)*(oldVet(j-1)^2)))
    end
    oldVet=newVet;
    aux = aux + deltaTB;
    newVet(divEspaco) = oldVet(divEspaco) - (C)*(oldVet(divEspaco) - oldVet(divEspaco-1)); %Contorno Direito
end
    
    for k =1:divEspaco
        y5(k) = newVet(k);
    end
plot(vetorEspaco, newVet,'r');
title("Equação de Burgers invíscida Método Conservativo");
grid on
hold on
texto_anotacao = sprintf('DeltaT: %.3f', deltaTB);
annotation('textbox',[0.63,0.2,0.2,0.7] ,'String',texto_anotacao,'FitBoxToText','on');
xlabel("Lx");
ylabel("Concentração");


%Plot sem anotacao para varios graficos (Necessario ir mudando a cor
%manualmente e os parametros no arquivo novaEntradaDados.m manualmente
%e comentar o plot de cima

% plot(vetorEspaco, newVet,'g');
% title("Equação de Burgers invíscida Método Conservativo");
% grid on
% hold on
% xlabel("Lx");
% ylabel("Concentração");



TempoProcessamento = toc
end