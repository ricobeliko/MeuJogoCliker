/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


//Lista de produtos
produtos = []; 

//Dados da minha surface de produtos
surf_prod	= noone;
prod_w		= 720;
prod_h		= 500;
prod_x		= 100;
prod_y		= 100;

//produtos[0] = instance_create_layer(0, 0, layer, obj_produto);

base_y = 80;
produtos_y = 0 + base_y;

cria_produtos = function(_qtd = 1)
{
	for(var i = 0; i < _qtd; i++)
	{
		
		//struct com os meus dados do jogo que eu estou pegando no arquivo json
		var _struct = global.struct_produtos[i];
		
		produtos[i] = instance_create_layer(0, 0, layer, obj_produto, _struct);
	}
}


rolagem_produtos = function()
{
	if (keyboard_check(vk_up))
	{
		produtos_y -= 10;	
	}
	if(keyboard_check(vk_down)) produtos_y += 10;
	
	//Descbrindo o valor máximo da rolagem para cima
	var _qtd = array_length(produtos);
	var _max = (96 * _qtd) + (20 * _qtd) + 20 - room_height;
	//Limitando  rolagem dos produtos
	produtos_y = clamp(produtos_y, - _max, base_y);
}

rolagem = function(_val = 10)
{
	var _qtd = 0;
	
	// roloando o scroll do mouse
	if (mouse_wheel_down())
	{
		_qtd = -_val;	
	}
	if (mouse_wheel_up())
	{
		_qtd = _val;	
	}
	return _qtd;
}
gerencia_produtos = function()
{
	//criando uma variavel estatica para o y
	static _meu_y = 0;
	var _alt = sprite_get_height(spr_produto);
	var _larg = sprite_get_width(spr_produto);
	var _marg = 20; 
	//Atualizando a varivem y 
	_meu_y += rolagem(30);
	
	var _qtd = array_length(produtos);
	var _max = (_alt * _qtd) * (_marg * _qtd) + _marg - room_height;
	//Limitando o meu y
	_meu_y = clamp(_meu_y, _max, 0);
	
	//rolagem_produtos();
	
	for (var i = 0; i < array_length(produtos); i++)
	{
		var _x = 25;
		var _y = _meu_y + _marg + ((i * _alt) + (i * _marg));
		
		with(produtos[i])
		{
			x = _x;	
			y = _y + sprite_height / 2;	
		}
	}
}

//Criando a surface dos produtos (limitador de espaço)
desenha_produtos = function()
{
	//Checando se a surface existe
	if(surface_exists(surf_prod))
	{
		//Fazer coisas na surface
		//Configurando a minha surface
		surface_set_target(surf_prod);
		draw_clear_alpha(c_black, 0);
		
		//draw_rectangle_color(0, 0, prod_w, prod_h, c_black, c_black, c_black, c_black, false);
		
		
	
		//Desenhando o produto dentro da surface
		with(obj_produto)
		{
			//Só vai aparecer se a pessoa tiver o dinheiro paracomprar o produto
			if(global.gold > custo / 2 or comprado)
			{
				desenha_produto();
				meu_x = other.prod_x;
				meu_y = other.prod_y;
			}
			
		}
		//resetando a minha surface
		surface_reset_target();
		
		// desenhando defato a surface
		draw_surface(surf_prod, prod_x, prod_y);
	
	}
	else // se a surface não existe eu crio ela
	{
		surf_prod = surface_create(prod_w, prod_h);
	}
}
//Criando a quantidade de produtos de que teenha na minha struct
cria_produtos(array_length(global.struct_produtos));





