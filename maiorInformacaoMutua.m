function [maxValue,posx,posy]=maiorInformacaoMutua(matriz,step)
    %{
    Encontra na matriz de informa��o mutua o valor mais elevado
    Depois calcula a posi��o na matriz da informa��o mutua e converte a
    para a posi��o na matriz de target original

    argumentos:
    matriz - matriz com a informa��o mutua
    step - saltos entre cada sec��o que foi comparada com query

    returns:
    maxValue - valor m�ximo de informa��o mutua na matriz
    posx,posy - cordenadas do canto superior da sec��o com informa��o m�xima
    %}
    
    maxValue=max(matriz(:));                %valor m�ximo da informa�~~ao mutua na matriz
    [posy,posx]=find(matriz==maxValue);     %Posi��o desse valor na matriz
    posx=((posx-1)*step)+1;                 %Ajuste do x
    posy=((posy-1)*step)+1;                 %Ajuste do y
end
