function matrizFinal=MatrizInfor(FichQuery,FichImagem,step)
    %{
    Devolve uma matriz de informa��es mutuas entre uma query e uma imagem
    com saltos de tamanho step entre sec��es da imagem

    argumentos:
    FichQuerry - Ficheiro da query
    FichImagem - Ficheiro com imagem pra correr com a query
    step - Saltos entre sec��es a ter testados

    returns:
    matrizFinal - matriz de informa��es mutuas
    %}

    query = imread(FichQuery);
    targetImage = imread(FichImagem);       
    [qlinhas,qcolunas]=size(query);
    [linhas,colunas]=size(targetImage);
    ilinhas=floor((linhas-qlinhas)/step+1);     %C�lculo das linhas da matriz que vai conter as informa��es mutuas
    icolunas=floor((colunas-qcolunas)/step+1);  %C�lculo das colunas da matriz que vai conter as informa��es mutuas
    matrizFinal=ones(ilinhas,icolunas);

    %correr a matriz da imagem e calcular a informa��o mutua entre a query e todas as sec��es possiveis e guarda na matriz final 
    counteri=1;
    for i=1:ilinhas
        counterj=1;
        for j=1:icolunas
            iInicial=counteri;          %
            iFinal=counteri+qlinhas-1;  %
            jInicial=counterj;          %
            jFinal=counterj+qcolunas-1; %sele��o da sec��o a comparar
            matrizBuffer=targetImage(iInicial:iFinal,jInicial:jFinal); %sec��o a comparar
            matrizFinal(i,j)=InformacaoMutua(query,matrizBuffer); %coloca��o na matriz final
            counterj=counterj+step; % a progress�o na imagem varia com o step
        end
        counteri=counteri+step; %a progress�o varia com o step
    end
end