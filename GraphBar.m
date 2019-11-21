function GraphBar(matrizBloco,alfabeto,n,indice,titulo)  
    %{
    Função que vai ser usada para fazer os graficos em 3D dos agrupamentos

    argumentos:
    matrizBloco - matriz já com os elementos agrupados, menos para o .wav onde vai dar a fonte
    alfabeto - matriz com os elementos unicos da matrizBloco
    n - numero de bits necessçários para codificar a amostra
    indice - indice onde se vai por o subplot
    titulo - titulo do graph

    %}
   figure(2); 
   subplot(2,3,indice);
   titulo=strcat("Entropia de agrupamentos de ",titulo);
   matrizGraph=zeros(power(2,n),power(2,n));%cria matriz de zeros para conter os valores possiveis
   if titulo=="Entropia de agrupamentos de soundMono.wav"
       D=2/power(2,8);%intervalo que é preciso percorrer para mudar de amostra
       vetorBinario=zeros(1,length(matrizBloco));
       for i=1:length(matrizBloco)
           vetorBinario(i)=(matrizBloco(i)+1)/D;%adiciona ao vetorBinario (acabar)
       end
       vetorBinario=vetorBinario(1:2:end-1)*power(2,n)+vetorBinario(2:2:end);%vai dar o shift left para agrupar o vetorBinario
       alfabeto=unique(vetorBinario);
       vectorBloco=Ocorrencias(vetorBinario,alfabeto);%devolve as ocorrencias do vectorBloco
       for i=1:length(vectorBloco)
           matrizGraph(floor(alfabeto(i)/power(2,n))+1,mod(alfabeto(i),power(2,n))+1)=vectorBloco(i); %serve para por o valor no local correto o valor
       end
   else
       vectorBloco=Ocorrencias(matrizBloco,alfabeto); %vetor que vai conter as ocorrencias da matriz concatenada
        for i=1:length(vectorBloco)
            matrizGraph(floor(alfabeto(i)/power(2,n))+1,mod(alfabeto(i),power(2,n))+1)=vectorBloco(i); %serve para por o valor no local correto
        end
   end
   bar3(matrizGraph)%vai fazer o grafico de barras em 3D
   title(titulo);
   
end