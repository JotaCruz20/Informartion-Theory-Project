function catRecognition(targetFich,queryFich,x,y)
    %{
    Mostra a imagem do gato e desenha um ret�ngulo an sec��o com
    informa��o mutua mais elevada
    
    argumentos:
    targetFich - Imagem a ser mostrada nas figuras
    queryFich - Imagem query para retirar as dimens�es da sec��o
    x,y - posi��o inicial do ret�ngulo
    %}
  
    query = imread(queryFich);
    target = imread(targetFich);
    [qlinhas,qcolunas]=size(query); %tira as dimens�o da query
    imshow(target);                 %Mostra a imagem na figura
    rectangle('Position', [x, y, qcolunas, qlinhas], 'LineWidth', 2, 'LineStyle', ':', 'EdgeColor', 'b'); %Desenha o ret�ngulo na figura
end
