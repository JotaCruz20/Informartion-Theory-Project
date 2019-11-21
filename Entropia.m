function entropia=Entropia(fonte,alfabeto)
    %{
    Calcula a entropia com base no alfabeto e numa fonte fornecida
    
    argumentos:
    fonte - fonte da qual queremos a entropia
    alfabeto - parametrizável para podermos alterar como desejarmos

    return:
    entropia - valor da entropia
    %}
    matrizProb=Probabilidade(fonte,alfabeto); %calcula a distribuição probabilistica
    entropia =  (-matrizProb(matrizProb ~= 0) * log2(matrizProb(matrizProb ~= 0)')); %calculo da entropia retirando os valores com prob = 0
end