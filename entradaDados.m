%% Variaveis e fun√ß√µes
ca = 10;
cb = 5;
cinj = 10;
cini = 20;
Lx = 500;
alfa = 0.000008;
tempo = 1000;
divEspaco = 700;
divTempo = 100;
u = 0.01;
phi = 15;
deltaX = Lx / divEspaco; % N√∫mero de divis√µes espaciais.
%deltaT = tempo / divTempo;  % N√∫mero de divis√µes temporais.
deltaT = 0.9*deltaX/u
deltaTMAX = (1)/(((2*alfa)/(deltaX^2)) + (u/deltaX));
aux = 0; % Definindo aux = 0 globalmente.
vetorEspaco = zeros(1,divEspaco); % Inicializando vetor da malha espacial.
oldVet = zeros(1,divEspaco); % Inicializando vetor da concentra√ß√£o antiga.
newVet = zeros(1,divEspaco); % Inicializando vetor da concentra√ß√£o nova.
C = (u*deltaT)/(deltaX);
thetaVet = ones(1,divEspaco);

psiVanleer = @(thetaVet) (thetaVet + abs(thetaVet)) ./ (1 + abs(thetaVet));
psiHquick = @(thetaVet) (2 * (thetaVet + abs(thetaVet))) ./ (3 + thetaVet);

min1 = min(1,2*thetaVet);
min2 = min(2,thetaVet);
min3 = min(min1,min2);
psiSuperbee = @(thetaVet) max(0,min3);
psiSuperbeeteste = @(thetaVet) max(0,min(1,2*thetaVet),min(2,thetaVet))


%Preenchendo vetores com as concentraÁıes
for i = 1:divEspaco
    oldVet(i)=cb;
end
for z = 1:divEspaco/2
    oldVet(z)=ca;
end

for i = 1:divEspaco
    newVet(i)=cb;
end
for z = 1:divEspaco/2
    newVet(z)=ca;
end
%% Preenchendo vetores pro plot da condiÁ„o inicial
vetorCini = zeros(1, tempo);
vetorTempo = zeros(1,tempo);
tamVetorTempo = length(vetorTempo);

for i=1:tempo
    vetorTempo(i) = i;

end
for j=1:tamVetorTempo/2
    vetorCini(j) = cini;
end
for k=(tamVetorTempo/2):tamVetorTempo
    vetorCini(k) = 10;
end




% Gr·fico CondiÁ„o Inicial

% plot(vetorTempo,vetorCini,'r');
% title("Troca da condiÁ„o inicial");
% xlabel("Lx");
% ylabel("CondiÁ„o inicial"); 



%%
for i = 2:divEspaco
    vetorEspaco(i) = vetorEspaco(i-1) + deltaX; % Preenchendo a malha come√ßando do i=2 por causa da condi√ß√£o de contorno
end

% Preencher o vetor com as condi√ß√µes iniciais, no while ele vai substituir
% os valores que n√£o sejam o indice 1.
% for i = 1:divEspaco
%     oldVet(i)=cini;
%     newVet(i)=cini;
% end

%oldVet(1) = cini; % Condi√ß√£o inicial no indice 1.
%newVet(1) = cini; % Condi√ß√£o inicial no indice 1.
