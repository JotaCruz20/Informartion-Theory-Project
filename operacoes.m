function operacoes(fonte,alfabeto,fich,indice)
%{
    Script para executar todas as operações dos files

    argumentos:
    -fonte->fonte sobre a qual vamos executar as operações
    -alfabeto->parameterizavel como desejarmos, mas principalmente vai ser
    os simbolos da fonte
    -fich->path para o ficheiro da fonte
    -indice->numero para o subplot dos histograma
%}
    
    [~,name,extension]=fileparts(fich);%vai obter o nome e a extensao do ficheiro
    figure(1);
    subplot(2,3,indice);
    string=strcat(name,extension);%vai concatenar as strings
    if name=="MRIbin"
        bar(Ocorrencias(fonte,alfabeto));%vai criar um grafico de barras com as ocorencias da fonte
        xticklabels(alfabeto);% põe no eixo dos X o alfabeto
        title(string);
    elseif name=="lyrics"
        alfa=char(alfabeto);%transforma o alfabeto em chars
        bar(uint16(alfabeto),Ocorrencias(fonte,alfabeto)); %faz o histograma do alfabeto pelo seu alfabeto
        set(gca,'XTick',alfabeto,'XTickLabels',alfa);% põe no eixo dos X o alfabeto
        title(string)
    else
        histogram(fonte);              %faz o histograma
        title(string);
    end
    
    fprintf('Entropia da informação: ');
    entropia=Entropia(fonte,alfabeto);%calcula a entropia das matrizes de probabilidade e da matriz dos codigos huffman
    fprintf('%f\n',entropia);
    
    fprintf('Número médio de bits: ');
    media=numeroMediodeBits(fonte,alfabeto);%vai calcular a media atraves da fonte e do alfabeto
    fprintf('%f\n',media);
    fprintf('Variancia do número médio de bits: ');
    variancia=varianciaNumeroDeBits(fonte,alfabeto);%vai calcular a variancia atraves da fonte e do alfabeto
    fprintf('%f\n',variancia);
    
    fprintf('Entropia dos agrupamentos: ');
    entropiaDeAgrupamentos=EntropiaDeAgrupamentos(fonte,fich);%vai calcular a entropia do agrupamento
    fprintf("%f\n",entropiaDeAgrupamentos);
    fprintf("\n");
   
end