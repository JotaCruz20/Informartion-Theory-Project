    function entropiaDeAgrupamentos=EntropiaDeAgrupamentos(fonte,fich)
%{
    Função que vai calcular a entropia de agrupamentos assim como fazer o
    seu grafico
    

    argumentos:
    fonte - fonte a qual vamos agrupar os seus elementos
    fich - path para o ficheiro da fonte

    return:
    entropiadeAgrupamentos->valor final da entropia de agrupamentos
%}

    [~,name,extension]=fileparts(fich);
    titulo=strcat(name,extension);
    if extension == ".wav"
        info=audioinfo(fich);%vai obter a informação do audio file
        n=info.BitsPerSample;%numero de bits para codificar a amostra
        fonte=fonte';
        matrizBloco=fonte(1:2:end-1)*power(2,n)+fonte(2:2:end);%vai servir para fazer o shift left para agrupar a fonte
        alfabeto=unique(matrizBloco);
        alfabeto=alfabeto';
        entropiaDeAgrupamentos=(Entropia(matrizBloco,alfabeto))/2;
        GraphBar(fonte,unique(fonte),n,1,titulo);%neste caso vai mandar o ficheiro fonte para poder transformar em binario
    elseif extension==".txt"
        n=8;%ficheiros sao codificados em ASCII logo so precisamos de 256
        matrizBloco=(uint16(fonte(1:2:end-1))*power(2,n)+uint16(fonte(2:2:end)));
        alfabeto=unique(matrizBloco);
        entropiaDeAgrupamentos=(Entropia(matrizBloco,alfabeto))/2; %faz o histograma, eixo x: alfabeto; eixo y: ocorreuncia de cada simbolo na fonte
        GraphBar(matrizBloco,unique(matrizBloco),n,2,titulo);%manda a matrizBloco, ou seja, os elementos ja agrupados, o numero de bits necessarios para codificar, o indice e o titulo
       
    elseif name=="MRIbin"
        info=imfinfo(fich);%vai obter a informação do ficheiro
        n=info.BitDepth;%numero de bits para codificar a amostra
        matrizBloco=uint16(fonte(1:2:end))*power(2,n)+uint16(fonte(2:2:end));
        alfabeto=unique(matrizBloco);
        alfabeto=uint16(alfabeto');
        entropiaDeAgrupamentos=(Entropia(matrizBloco,alfabeto))/2;
        GraphBar(matrizBloco,unique(matrizBloco),n,3,titulo);%manda a matrizBloco, ou seja, os elementos ja agrupados, o numero de bits necessarios para codificar, o indice e o titulo
      
    elseif extension==".bmp"
        info=imfinfo(fich);%vai obter a informação do ficheiro
        n=info.BitDepth;%numero de bits para codificar a amostra
        matrizBloco=uint16(fonte(1:2:end-1))*power(2,n)+uint16(fonte(2:2:end));
        alfabeto=unique(matrizBloco);
        alfabeto=alfabeto';
        entropiaDeAgrupamentos=(Entropia(matrizBloco,alfabeto))/2;
        if(name=="landscape")%if para por no subplot correto
            GraphBar(matrizBloco,unique(matrizBloco),n,4,titulo);
        elseif(name=="MRI")
            GraphBar(matrizBloco,unique(matrizBloco),n,5,titulo);
           
        end
    end
end