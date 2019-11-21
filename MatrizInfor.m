function matrizFinal=MatrizInfor(FichQuery,FichImagem,step)
    %{
    Devolve uma matriz de informações mutuas entre uma query e uma imagem
    com saltos de tamanho step entre secções da imagem

    argumentos:
    FichQuerry - Ficheiro da query
    FichImagem - Ficheiro com imagem pra correr com a query
    step - Saltos entre secções a ter testados

    returns:
    matrizFinal - matriz de informações mutuas
    %}

    query = imread(FichQuery);
    targetImage = imread(FichImagem);       
    [qlinhas,qcolunas]=size(query);
    [linhas,colunas]=size(targetImage);
    ilinhas=floor((linhas-qlinhas)/step+1);     %Cálculo das linhas da matriz que vai conter as informações mutuas
    icolunas=floor((colunas-qcolunas)/step+1);  %Cálculo das colunas da matriz que vai conter as informações mutuas
    matrizFinal=ones(ilinhas,icolunas);

    %correr a matriz da imagem e calcular a informação mutua entre a query e todas as secções possiveis e guarda na matriz final 
    counteri=1;
    for i=1:ilinhas
        counterj=1;
        for j=1:icolunas
            iInicial=counteri;          %
            iFinal=counteri+qlinhas-1;  %
            jInicial=counterj;          %
            jFinal=counterj+qcolunas-1; %seleção da secção a comparar
            matrizBuffer=targetImage(iInicial:iFinal,jInicial:jFinal); %secção a comparar
            matrizFinal(i,j)=InformacaoMutua(query,matrizBuffer); %colocação na matriz final
            counterj=counterj+step; % a progressão na imagem varia com o step
        end
        counteri=counteri+step; %a progressão varia com o step
    end
end