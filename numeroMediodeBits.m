function average=numeroMediodeBits(fonte,alfabeto)
    %{
    Calcula o n�mero m�dio de bits para codificar uma fonte

    argumentos:
    fonte - para calcular o n�mero m�dio de bits dessa fonte
    alfabeto - parametriz�vel como desejarmos
    
    return:
    average - n�mero m�dio de bits
    %}

    average=momentoCentradoNumeroDeBits(fonte,alfabeto,1);
end