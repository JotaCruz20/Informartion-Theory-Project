function inforMutua = InformacaoMutua(query,target)
    %{
    Calcula a informa��o mutua entre duas matrizes
    I(target;query)=H(target)+H(query)-H(target,query)

    argumentos:
    query - matriz query
    target - sec��o de uma imagem target com o mesmo tamanho que query
    
    return:
    inforMutua - valor da informa��o mutua entre as duas matrizes
    %}

    EntropiaQuery=Entropia(query,unique(query)); %H(query)
    EntropiaTarget=Entropia(target,unique(target)); %H(target)
    
    
    
    %H(X,Y)
    matrizConjunta=uint16(query)*power(2,8)+uint16(target); %agrupamento dos simbolos das duas matrizes
    alfabetoConjunto=unique(matrizConjunta); %cria��o do novo alfabeto
    
    EntropiaConjunta=Entropia(matrizConjunta,alfabetoConjunto);%calculo da entropia conjunta

    inforMutua=EntropiaTarget+EntropiaQuery-EntropiaConjunta;%H(query)+H(target)-H(query,target)
end

