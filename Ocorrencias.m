function matrizOcorrencias=Ocorrencias(fonte,alfabeto)  
    %{
    Devolve a matriz de ocorr�ncias de uma fonte

    argumentos:
    fonte - para calcular o n�mero m�dio de bits dessa fonte
    alfabeto - parametriz�vel como desejarmos
    
    return:
    matrizOcorrencias - matriz com as ocorr�ncias de cada simbolo do alfabeto
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