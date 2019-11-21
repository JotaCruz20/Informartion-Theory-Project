function [maxValue,posx,posy]=maiorInformacaoMutua(matriz,step)
    %{
    Encontra na matriz de informação mutua o valor mais elevado
    Depois calcula a posição na matriz da informação mutua e converte a
    para a posição na matriz de target original

    argumentos:
    matriz - matriz com a informação mutua
    step - saltos entre cada secção que foi comparada com query

    returns:
    maxValue - valor máximo de informação mutua na matriz
    posx,posy - cordenadas do canto superior da secção com informação máxima
    %}
    
    maxValue=max(matriz(:));                %valor máximo da informaç~~ao mutua na matriz
    [posy,posx]=find(matriz==maxValue);     %Posição desse valor na matriz
    posx=((posx-1)*step)+1;                 %Ajuste do x
    posy=((posy-1)*step)+1;                 %Ajuste do y
end
