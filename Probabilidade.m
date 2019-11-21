function matrizProb=Probabilidade(fonte,alfabeto)
    %{
    Devolve a matriz de probabilidades de uma fonte

    argumentos:
    fonte - para calcular o número médio de bits dessa fonte
    alfabeto - parametrizável como desejarmos
    
    return:
    matrizProb - matriz com as probabilidades de cada  do alfabeto
    %}

    matrizOcorrencias=Ocorrencias(fonte,alfabeto); %obtém a matriz ocorr~encias de um alfabeto
    
    matrizProb = matrizOcorrencias/sum(matrizOcorrencias);  %calcula distribuiçao estatistica
end  