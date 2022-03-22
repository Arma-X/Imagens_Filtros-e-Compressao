clc;
clear;



//=========================================================================================//
//=============================-Processamentos de imagens-=================================//
//=========================================================================================//



///////////////////////////////////////-janela1-/////////////////////////////////////////
j1=scf(1);j1.name='Primeira Janela';

//----------------------------------------/imagem original/---------------------------------/

subplot(221)
img_original = imread('D:\Hugo_Faculdade\Muitimidia\Trabalho 5\teste.jpg');
imshow(img_original);
title('imagem original');

//--------------------------------------/imagem negativa/---------------------------------//

subplot(222)
img_negativa = imcomplement(img_original);
imshow(img_negativa);
title('imagem negativa');

//-----------------------------/imagem em niveis de cinza/---------------------------------//

subplot(223)
img_cinza = rgb2gray(img_original);
imshow(img_cinza);
title('Imagem com nivel de cinza');
//imshow(img_cinza,jetcolormap(256));

//--------------------------/imagem em niveis de cinza invertido/--------------------------//

subplot(224)
img_cinza_invertida = uint8(255 * ones(size(img_cinza,1), size(img_cinza,2))) - img_cinza;
imshow(img_cinza_invertida);
//imshow(LogicalImage2,jetcolormap(256));
title('Imagem com nivel de cinza invertido');


/////////////////////////////////////////-janela2-/////////////////////////////////////////
j2=scf(2);j2.name='Segunda janela';


//----------------------/imagem binaria(nivel da separação 0.312)/-------------------------//

subplot(221)
level = imgraythresh (img_cinza);
graylevel = 0.312;
img_logica_binaria = im2bw(img_cinza, graylevel);
imshow(img_logica_binaria);
title('imagem binaria (nivel de separação em nivel de cinza 0.312) ');

//----------/imagem binaria Invertida (nivel da separação complementar)/-------------------//

subplot(222)
level = imgraythresh (img_cinza_invertida);
graylevel_complementar = 1 - graylevel;
img_logica_binaria_invertida = im2bw(img_cinza_invertida, graylevel_complementar);
imshow(img_logica_binaria_invertida);
title('imagem binaria invertida (nivel de separação em nivel de cinza complementar *0.698*)');

//-------------------------/imagem binaria com jetcolormap/-------------------------------//

subplot(223)
imshow(img_logica_binaria,jetcolormap(256));
title('imagem binaria com jetcolormap');

//---------------------/imagem binaria invertida com jetcolormap/-------------------------//

subplot(224)
imshow(img_logica_binaria_invertida,jetcolormap(256));
title('imagem binaria invertida com jetcolormap');


/////////////////////////////////////////-janela3-/////////////////////////////////////////
j3=scf(3);j3.name='terceira janela';


//--------------/imagem com nivel de borrão de cores em jetcolormap/---------------//

subplot(221)
[ObjectImage,n1] = imlabel(img_logica_binaria);
imshow(ObjectImage,jetcolormap(n1))
title('imagem com nivel de borrão de cores em jetcolormap');

//-------------/imagem iverntida com nivel de borrão de cores em jetcolormap/------//

subplot(222)
[ObjectImage,n2] = imlabel(img_logica_binaria_invertida);
imshow(ObjectImage,jetcolormap(n2))
title('imagem iverntida com nivel de borrão de cores em jetcolormap');




//=========================================================================================//
//=====================================-Filtros-===========================================//
//=========================================================================================//
//
//
//
//j4=scf(4);j4.name='Aplicação dos filtros';
//
//
////-------------------------------------/imagem original/----------------------------------//
//
//subplot(221)
//img_original = imread('C:\Users\Arma-X\Desktop\Muitimidia\Trabalho 5\Imagens_originais\teste .tif')
//imshow(img_original);
//title('Imagem original');
//
////----------------------------/Negativa da imagem original/-------------------------------//
//
//subplot(222)
//img_negativa_ = imcomplement(img_original);
//imshow(img_negativa_);
//title('Negativa da imagem original');
//
////----------------------------------/Filtro passa-baixa/---------------------------------//
////
//subplot(223)
//a=double(img_original);
//[m,n] =size(a);
//w= [1 1 1;1 2 1;1 1 1];
//for i=2:m-1
//    for j=2:n-1
//        b(i,j)=(w(1)*a(i-1,j+1)+w(2)*a(i,j+1)+w(3)*a(i+1,j+1)+w(4)*a(i-1,j)+w(5)*a(i,j)+w(6)*a(i+1,j)+w(7)*a(i-1,j-1)+w(8)*a(i,j-1)+w(9)*a(i+1,j-1))/10;
//    end
//end
//c=uint8(b);
//imshow(c);
//imwrite(c,'C:\Users\Arma-X\Desktop\Muitimidia\Trabalho 5\Imagens_com_filtro\teste(pass-baixa).tif')
//title('Imagem com o filtro passa-baixa aplicado');
//
////----------------------------------/Filtro passa-alta/---------------------------------//
//
//subplot(224)
//z = [-1 -1 -1;-1 8 -1;-1 -1 -1];
//for i=2:m-1
//    for j=2:n-1
//        d(i,j)=(z(1)*a(i-1,j+1)+z(2)*a(i,j+1)+z(3)*a(i+1,j+1)+z(4)*a(i-1,j)+z(5)*a(i,j)+z(6)*a(i+1,j)+z(7)*a(i-1,j-1)+z(8)*a(i,j-1)+z(9)*a(i+1,j-1))/9;
//    end
//end
//e=uint8(d);
//imshow(e);
//imwrite(e,'C:\Users\Arma-X\Desktop\Muitimidia\Trabalho 5\Imagens_com_filtro\teste(pass-alta).tif')
//title('Imagem com o filtro passa-baixa aplicado');
//
//
//
//=========================================================================================//
//=====================================-Compressão-========================================//
//=========================================================================================//


//
//A = im2double(imread("C:\Users\Arma-X\Desktop\Muitimidia\Trabalho 5\Imagens_originais\bliss(leve2).tif")); 
//
//[U,S,V,rk] = svd(A); 
//Valores_singulares = diag(S);
//
//
//Dimensoes_singulares_para_teste = [5 ,15 ,25 ,35 ,45];  
//
//Porcentagem_da_maior_dimensão_para_teste = [1, 0.4, 0.01];
//
//Total_de_colunas = 3;
//
//Numero_total_de_plots = 1 + length(Dimensoes_singulares_para_teste) + length(Porcentagem_da_maior_dimensão_para_teste);
//
//Total_de_linhas = (Numero_total_de_plots)/(Total_de_colunas);
//
//if (modulo(Numero_total_de_plots, Total_de_colunas) <> 0) then
//   Total_de_linhas = Total_de_linhas+1;
//end
//
//// Imagem original
//
//f = scf(1);
//clf(1);
//f.figure_name = 'Compressão utilizando SVD';
//subplot(Total_de_linhas,Total_de_colunas,1);
//imshow(A)
//xtitle(['Imagem Original';  string(rk) + ' dimensões singulares'])
//
//
//// Dimensões singulares 
//
//for i = 1:length(Dimensoes_singulares_para_teste)
//   Dimensao_singular = Dimensoes_singulares_para_teste(i);
//   Novo_A = U(:, 1:Dimensao_singular)*S(1:Dimensao_singular, 1:Dimensao_singular)*V(:, 1:Dimensao_singular)' ; 
//   Erro=Valores_singulares(Dimensao_singular+1); 
//   subplot(Total_de_linhas,Total_de_colunas,i+1);
//   imshow(Novo_A);
//   xtitle([string(Dimensao_singular)+' dimensões singulares'; ' Erro Espectral Normal = ' + string(Erro)]);
//end
////imwrite(Novo_A,'C:\Users\Arma-X\Desktop\Muitimidia\Trabalho 5\Imagens_com_compressão\bliss(mod1).tif');
//
//// Porcentagem da maior dimensão regular 
//
//for j = 1:length(Porcentagem_da_maior_dimensão_para_teste)
//    Porcentagem_teste = Porcentagem_da_maior_dimensão_para_teste(j);
//    
//// Pega os indeces dos valores singulares que contribuem mais que X% do maior valor singular 
//
//   indicesOfValores_singulares = find(Valores_singulares > (Porcentagem_teste/100)*max(Valores_singulares));
//   Novo_A = U(:, indicesOfValores_singulares)*S(indicesOfValores_singulares,indicesOfValores_singulares)*V(:, indicesOfValores_singulares)';
//   Dimensao_singular = length(indicesOfValores_singulares);
//   Erro=Valores_singulares(Dimensao_singular+1);
//   subplot(Total_de_linhas,Total_de_colunas,1+length(Dimensoes_singulares_para_teste)+j);
//   imshow(Novo_A);
//   xtitle([string(Dimensao_singular) + ' dimensões singulares'; string(Porcentagem_teste) + '% do maior valor singular' ; ' Erro Espectral Normal = ' + string(Erro)])
//end
//
////imwrite(Novo_A,'C:\Users\Arma-X\Desktop\Muitimidia\Trabalho 5\bliss(mod7).tif');
//
//
//
//
//
//
//











