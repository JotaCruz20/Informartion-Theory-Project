function variancia=varianciaNumeroDeBits(fonte,alfabeto)
    %{
    Calcula a variancia do número médio de bits para codificar uma fonte

    argumentos:
    fonte - para calcular o número médio de bits dessa fonte
    alfabeto - parametrizável como desejarmos
    
    return:
    variancia - variancia do número médio de bits
    %}
    
    media=numeroMediodeBits(fonte,alfabeto);                                %E(X)
    momentoCentradoDeOrdem2=momentoCentradoNumeroDeBits(fonte,alfabeto,2);  %E(X^2)
    variancia= momentoCentradoDeOrdem2-power(media,2);                      %V(X)=E(X^2)-(E(X))^2
end
    