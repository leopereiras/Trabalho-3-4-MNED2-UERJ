%% Variaveis e funções
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
deltaX = Lx / divEspaco; % Número de divisões espaciais.
%deltaT = tempo / divTempo;  % Número de divisões temporais.
deltaT = 0.9*deltaX/u
deltaTMAX = (1)/(((2*alfa)/(deltaX^2)) + (u/deltaX));
aux = 0; % Definindo aux = 0 globalmente.
vetorEspaco = zeros(1,divEspaco); % Inicializando vetor da malha espacial.
oldVet = zeros(1,divEspaco); % Inicializando vetor da concentração antiga.
newVet = zeros(1,divEspaco); % Inicializando vetor da concentração nova.
C = (u*deltaT)/(deltaX);
thetaVet = ones(1,divEspaco);

psiVanleer = @(thetaVet) (thetaVet + abs(thetaVet)) ./ (1 + abs(thetaVet));
psiHquick = @(thetaVet) (2 * (thetaVet + abs(thetaVet))) ./ (3 + thetaVet);

min1 = min(1,2*thetaVet);
min2 = min(2,thetaVet);
min3 = min(min1,min2);
psiSuperbee = @(thetaVet) max(0,min3);
psiSuperbeeteste = @(thetaVet) max(0,min(1,2*thetaVet),min(2,thetaVet))


%Preenchendo vetores com as concentra��es
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
%% Preenchendo vetores pro plot da condi��o inicial
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




% Gr�fico Condi��o Inicial

% plot(vetorTempo,vetorCini,'r');
% title("Troca da condi��o inicial");
% xlabel("Lx");
% ylabel("Condi��o inicial"); 



%%
for i = 2:divEspaco
    vetorEspaco(i) = vetorEspaco(i-1) + deltaX; % Preenchendo a malha começando do i=2 por causa da condição de contorno
end

% Preencher o vetor com as condições iniciais, no while ele vai substituir
% os valores que não sejam o indice 1.
% for i = 1:divEspaco
%     oldVet(i)=cini;
%     newVet(i)=cini;
% end

%oldVet(1) = cini; % Condição inicial no indice 1.
%newVet(1) = cini; % Condição inicial no indice 1.
