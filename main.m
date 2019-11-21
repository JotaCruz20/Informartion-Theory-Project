clc


disp('Fonte: landscape.bmp');
fich='landscape.bmp';
fonte = imread(fich);                %gera a partir da imagem uma matriz de pixeis bidimensional numa escala de cinzentos
alfabeto = uint16(unique(fonte));    %alfabeto gerado da fonte
operacoes(fonte,alfabeto,fich,1)     %operações do exercicio 1 até 5


disp('Fonte: MRI.bmp');
fich='MRI.bmp';
fonte = imread(fich);                   %gera a partir da imagem uma matriz de pixeis bidimensional numa escala de cinzentos
alfabeto = uint16(unique(fonte));       %alfabeto gerado da fonte
operacoes(fonte,alfabeto,fich,2);       %operações do exercicio 1 até 5


disp('Fonte: MRIbin.bmp');
fich='MRIbin.bmp';
fonte = imread(fich);                   %gera a partir da imagem uma matriz de pixeis bidimensional de 0 ou 255(branco ou preto)
alfabeto = unique(fonte);               %[0,255]
operacoes(fonte,alfabeto,fich,3);       %operações do exercicio 1 até 5



disp('Fonte: soundMono.wav');
fich='soundMono.wav';
[fonte,fs] = audioread(fich);
d=2/power(2,8);                           %d É o intervalo entre amostras sucessivas, que é dado por 2/power(2,n) onde n e o numero de bits per sample obtido a partir da informação do audio
alfabeto =[-1:d:1-d]';                    %alfabeto vai de -1 a 1 com intervalos d=8
operacoes(fonte,alfabeto,fich,4);         %operações do exercicio 1 até 5


disp('Fonte: lyrics.txt');
fich='lyrics.txt';
texto = fopen(fich,'r');                                        %abre o ficheiro de texto no modo read
fonte = fread(texto);                                           %Lê o texto para a variável fonte
fonte=fonte(fonte>=97 & fonte<=122 | fonte>=65 & fonte<=90);    %Elimina todos os carateres especiais                                     %alfabeto a-z e A-Z
alfabeto = uint16(unique(fonte));
operacoes(fonte,alfabeto,fich,5);                               %operações do exercicio 1 até 5 








%Ex6b)------------------------------------------------------------------------------
fprintf("Valor máximo da informação mútua\n\n");
figure(3);

info_target_original=MatrizInfor("query.bmp","target_original.bmp",15); %matriz informação
[max,x,y]=maiorInformacaoMutua(info_target_original,15);                %cálculo do máximo da matriz informação e da sua posição no target
fprintf("target_original.bmp: %5f Posição: (%d,%d)\n",max,x,y);
subplot(2,2,1);
catRecognition("target_original.bmp","query.bmp",x,y);                  %desenho de um retangulo na imagem target na posição com maáxima entropia 


info_target_noise=MatrizInfor("query.bmp","target_noise.bmp",15);       %matriz informação
[max,x,y]=maiorInformacaoMutua(info_target_noise,15);                   %cálculo do máximo da matriz informação e da sua posição no target
fprintf("target_noise.bmp: %5f Posição: (%d,%d)\n",max,x,y);
subplot(2,2,2);
catRecognition("target_noise.bmp","query.bmp",x,y);                     %desenho de um retangulo na imagem target na posição com maáxima entropia


info_target_inverted=MatrizInfor("query.bmp","target_inverted.bmp",15); %matriz informação
[max,x,y]=maiorInformacaoMutua(info_target_inverted,15);                %cálculo do máximo da matriz informação e da sua posição no target
fprintf("target_inverted.bmp: %5f Posição: (%d,%d)\n",max,x,y);
subplot(2,2,3);
catRecognition("target_inverted.bmp","query.bmp",x,y);                  %desenho de um retangulo na imagem target na posição com maáxima entropia


info_target_lightning_contrast=MatrizInfor("query.bmp","target_lightning_contrast.bmp",15);     %matriz informação
[max,x,y]=maiorInformacaoMutua(info_target_lightning_contrast,15);                              %cálculo do máximo da matriz informação e da sua posição no target
fprintf("target_lightning_contrast.bmp: %5f Posição: (%d,%d)\n\n",max,x,y);
subplot(2,2,4);
catRecognition("target_lightning_contrast.bmp","query.bmp",x,y);                                %desenho de um retangulo na imagem target na posição com maáxima entropia












%6c)---------------------------------------------------------------------------------
fprintf("Valor máximo da informação mútua\n\n");
figure(4);

info_target_original=MatrizInfor("query.bmp","target1.bmp",15);     %matriz informação
[max,x,y]=maiorInformacaoMutua(info_target_original,15);            %cálculo do máximo da matriz informação e da sua posição no target
fprintf("target1.bmp: %5f Posição: (%d,%d)\n",max,x,y);
subplot(2,2,1);
catRecognition("target1.bmp","query.bmp",x,y);                      %desenho de um retangulo na imagem target na posição com maáxima entropia


info_target_noise=MatrizInfor("query.bmp","target2.bmp",15);    %matriz informação
[max,x,y]=maiorInformacaoMutua(info_target_noise,15);           %cálculo do máximo da matriz informação e da sua posição no target
fprintf("target2.bmp: %5f Posição: (%d,%d)\n",max,x,y);
subplot(2,2,2);
catRecognition("target2.bmp","query.bmp",x,y);                  %desenho de um retangulo na imagem target na posição com maáxima entropia


info_target_inverted=MatrizInfor("query.bmp","target3.bmp",15); %matriz informação
[max,x,y]=maiorInformacaoMutua(info_target_inverted,15);        %cálculo do máximo da matriz informação e da sua posição no target
fprintf("target3.bmp: %5f Posição: (%d,%d)\n",max,x,y);
subplot(2,2,3);
catRecognition("target3.bmp","query.bmp",x,y);                  %desenho de um retangulo na imagem target na posição com maáxima entropia


info_target_lightning_contrast=MatrizInfor("query.bmp","target4.bmp",15);   %matriz informação
[max,x,y]=maiorInformacaoMutua(info_target_lightning_contrast,15);          %cálculo do máximo da matriz informação e da sua posição no target
fprintf("target4.bmp: %5f Posição: (%d,%d)\n",max,x,y);
subplot(2,2,4);
catRecognition("target4.bmp","query.bmp",x,y);                  %desenho de um retangulo na imagem target na posição com maáxima entropia

