function variancia=varianciaNumeroDeBits(fonte,alfabeto)
    %{
    Calcula a variancia do n�mero m�dio de bits para codificar uma fonte

    argumentos:
    fonte - para calcular o n�mero m�dio de bits dessa fonte
    alfabeto - parametriz�vel como desejarmos
    
    return:
    variancia - variancia do n�mero m�dio de bits
    %}
    
    media=numeroMediodeBits(fonte,alfabeto);                                %E(X)
    momentoCentradoDeOrdem2=momentoCentradoNumeroDeBits(fonte,alfabeto,2);  %E(X^2)
    variancia= momentoCentradoDeOrdem2-power(media,2);                      %V(X)=E(X^2)-(E(X))^2
end
    