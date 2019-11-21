function momento=momentoCentradoNumeroDeBits(fonte,alfabeto,ordem)
    %{
    Devolve o momento centrado de uma ordem escolhida a partir da matriz
    hufflen

    argumentos:
    fonte,alfabeto - usados no cálculo da matriz que tem o número de bits para codificar cada simbolo
    ordem - ordem do momento centrado

    return:
    momento - momento de certa ordem calculado a partir das matrizes de hufflen
    %}


    matrizHufflen=hufflen(Ocorrencias(fonte,alfabeto)); %matriz com o número de bits necessário para codificar cada simbolo
    matrizHufflen = matrizHufflen.^ordem; %adaptação à ordem do momento

    matrizProb= Probabilidade(fonte,alfabeto); 
    momento=matrizHufflen*matrizProb'; %momento centrado(ordem 1 == média)

end