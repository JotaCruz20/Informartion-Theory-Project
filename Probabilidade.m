function matrizProb=Probabilidade(fonte,alfabeto)
    %{
    Devolve a matriz de probabilidades de uma fonte

    argumentos:
    fonte - para calcular o n�mero m�dio de bits dessa fonte
    alfabeto - parametriz�vel como desejarmos
    
    return:
    matrizProb - matriz com as probabilidades de cada  do alfabeto
    %}

    matrizOcorrencias=Ocorrencias(fonte,alfabeto); %obt�m a matriz ocorr~encias de um alfabeto
    
    matrizProb = matrizOcorrencias/sum(matrizOcorrencias);  %calcula distribui�ao estatistica
end  