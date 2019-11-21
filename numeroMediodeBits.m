function average=numeroMediodeBits(fonte,alfabeto)
    %{
    Calcula o número médio de bits para codificar uma fonte

    argumentos:
    fonte - para calcular o número médio de bits dessa fonte
    alfabeto - parametrizável como desejarmos
    
    return:
    average - número médio de bits
    %}

    average=momentoCentradoNumeroDeBits(fonte,alfabeto,1);
end