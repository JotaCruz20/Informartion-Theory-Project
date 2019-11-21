function matrizOcorrencias=Ocorrencias(fonte,alfabeto)  
    %{
    Devolve a matriz de ocorrências de uma fonte

    argumentos:
    fonte - para calcular o número médio de bits dessa fonte
    alfabeto - parametrizável como desejarmos
    
    return:
    matrizOcorrencias - matriz com as ocorrências de cada simbolo do alfabeto
    %}

    [linhas,colunas]=size(alfabeto);
    if colunas==1 %para alfabeto vertical
        alfabeto=[alfabeto;alfabeto(linhas)+1]; %ajusta o alfabeto para ser usado pelo histcounts
        matrizOcorrencias=histcounts(fonte,alfabeto);
    elseif linhas==1 %para alfabeto horizontal
        alfabeto=[alfabeto,alfabeto(colunas)+1]; %ajusta o alfabeto para ser usado pelo histcounts
        matrizOcorrencias=histcounts(fonte,alfabeto);
    end
end           