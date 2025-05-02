/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//segundo = 0;
//terceiro = 0;


// meu level
level = 0;

//Mais imformações do produto
timer = 0;

meu_x = 0;
meu_y = 0;
//definindo se devo fazer
fazer = false;
infos = false;

Tenho_manager = false;

//Meus custos
custo = custo_base;

comprado = false;
efeito_comprar = false;


//Meus lucros
lucro = lucro_base;

//Me inserindo na lista de produtos
global.produtos[indice] = id;

incremento = 1.07;

comprar = function()
{
	//Tirando o dinheiro depois da compra
	global.gold -= custo;
	comprado = true;
	
	var _custo_atual = floor(custo_base * (power(incremento, level)));
	//Aumentando o custo do produto a cada compra
	custo += _custo_atual;
	//ajustando o lucro
	// subindo o lvl
	level++;
	//lucro vai ser com base em level e luvro base
	lucro = lucro_base * level;	
}

ajusta_infos = function()
{
	lucro = lucro_base * level;	
	custo = floor(custo_base * (power(incremento, level)));
	//Atualizando o comprado
	if (comprado) fazer = true;
}

acao = function()
{
	timer = 0;
	fazer = Tenho_manager;
	//Dando o lucro
	global.gold += lucro;
}



//Desenhando o produto
desenha_produto = function()
{
	//Me desenhado
	draw_self();
	draw_set_font(fnt_texto);

	//Desenhado o produto na minha esquerda
	draw_sprite(spr_item, indice, x, y - 16);
	
	// alinhado o texto
	draw_set_valign(1);
	draw_set_halign(1);

	//Desenhando o level do item
	//Fazendo um elipse atras do texto
	var _x = x;
	var _y = y + 24;
	draw_ellipse_color(_x - 24, _y - 16, _x + 24, _y + 16, c_dkgray, c_dkgray, false);
	
	//Configururando o alpha
		gpu_set_colorwriteenable(1, 1, 1, 0);
	draw_text(_x, _y, level);
	//Resetando o alpha
		gpu_set_colorwriteenable(1, 1, 1, 1);
		

	//Desenhando a barra de progresso
	var _x1 = x + 42;
	var _y1 = y - 32;
	var _larg = sprite_width / 1.2;
	var _x2 = _x1 + _larg;
	var _y2 = _y1 + sprite_height/ 4;
	//desenhando as  bordas da barra
	draw_rectangle_color(_x1 - 1, _y1 - 1, _x2 + 1, _y2 + 1, c_black, c_black, c_black, c_black, false);
	//desenhando o fundo da barra
	draw_rectangle_color(_x1, _y1, _x2, _y2, c_gray, c_gray, c_gray, c_gray, false); 
	//desenhando o progreço da barra
	var _progresso = (timer / tempo) * _larg;
	draw_rectangle_color(_x1, _y1, _x1 + _progresso, _y2, c_green, c_green, c_green, c_green, false);

	//Desenhando o quanto que eu rendo
	//Ajustando o alinhamento
	draw_set_halign(2);
	var _str = convert_num(lucro);
	
	//Configururando o alpha
		gpu_set_colorwriteenable(1, 1, 1, 0);
	draw_text(_x2 - 4, _y1 + sprite_height / 8, _str);

	//voltando o alinhamento para o centro
	draw_set_halign(1);

	//Desenhando o eu preço
	//Desenhando o quadrado do preço
	_x1 = x + 42;
	_y1 = y + 8;
	var _larg = sprite_width / 2;
	_x2 = _x1 + _larg;
	_y2 = _y1 + 32;
	// Definindo a cor com bas na possibilidade de comprar
	var _cor = global.gold >= custo ? c_green : c_gray;
	var _str = convert_num(custo);
	//Desenhando umas bordas se o mouse estiver em cima da caixa
	if(efeito_comprar)
	{
		draw_rectangle_color(_x1 - 1, _y1 - 1, _x2 + 1, _y2 + 1, c_white, c_white, c_white, c_white, 0);
	}
	draw_rectangle_color(_x1, _y1, _x2, _y2, _cor, _cor, _cor, _cor, 0);
	draw_text_transformed(_x1 + _larg / 2, _y1 + 16, _str, 1, 1, 0);
	
	
	//Desenhando o tempo que leva
	//descobrindo quantos segundos ele leva para gerar renda
	var _s = floor((tempo - timer) % 60);
	var _m = ((tempo - timer) div 60) % 60;
	var _h = ((tempo - timer) div 60) div 60;
	draw_set_halign(2);

	//definindo a exibição do texto melhorada
	var _seg = _s > 9 ? _s : "0" + string(_s);
	var _min = _m > 9 ? _m : "0" + string(_m);
	var _hor = _h > 9 ? _h : "0" + string(_h);
	draw_text(x + sprite_width - 24, _y1 + 16, string("{0}:{1}:{2}", _hor, _min, _seg));
		//Resetando o alpha
		gpu_set_colorwriteenable(1, 1, 1, 1);
		
	draw_set_halign(1);
	// resetando o alinhamento do meu texto
	draw_set_valign(-1);
	draw_set_halign(-1);

	if(infos)
	{
		exibe_info();	
	}
	draw_set_font(-1);
}
//Exibindo as informaçoes do produto
exibe_info = function()
{
	var _x1 = x + sprite_width + 12;
	var _y1 = y - sprite_height/2;
	var _marg = 10;
	
	//Desenhand a caixinha que fica em baixo do produto
	draw_sprite_stretched(spr_info, 0 , _x1, _y1, sprite_width, sprite_height);
	
	//nome do produto
	
	//configurando o alpha
		gpu_set_colorwriteenable(1, 1, 1, 0);
	draw_text(_x1 + _marg, _y1 + _marg, nome);
	
	//Descrição

	draw_text_ext(_x1 + _marg, _y1 + 30 + _marg, descricao, 20, sprite_width - _marg * 2);
//Resetando o alpha
		gpu_set_colorwriteenable(1, 1, 1, 1);
}














