function catRecognition(targetFich,queryFich,x,y)
    %{
    Mostra a imagem do gato e desenha um retângulo an secção com
    informação mutua mais elevada
    
    argumentos:
    targetFich - Imagem a ser mostrada nas figuras
    queryFich - Imagem query para retirar as dimensões da secção
    x,y - posição inicial do retângulo
    %}
  
    query = imread(queryFich);
    target = imread(targetFich);
    [qlinhas,qcolunas]=size(query); %tira as dimensão da query
    imshow(target);                 %Mostra a imagem na figura
    rectangle('Position', [x, y, qcolunas, qlinhas], 'LineWidth', 2, 'LineStyle', ':', 'EdgeColor', 'b'); %Desenha o retângulo na figura
end
