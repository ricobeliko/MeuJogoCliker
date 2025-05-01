/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
//atualiza_tempo();

//segundo += global.gamesegundos;
//terceiro += global.framerate;


if (comprado)
{
	if (fazer)
	{
		//Aumentando o timer
		timer += global.framerate;

		// enchendo a barra de progresso e parando
		if(timer > tempo)
		{
			acao();
		}
	}
}

//Checando se a pessoa clicou nele
var _mouse_sobre = position_meeting(mouse_x - meu_x, mouse_y - meu_y, id);
var _mouse_click = mouse_check_button_pressed(mb_left);

if(_mouse_sobre)
{
	if (_mouse_click)
	{
	
		fazer = true;
	}
	//Checando se o mouse esta na caixa de comprar
	var _x1 = x + 42;
	var _y1 = y + 8;
	var _x2 = _x1 + sprite_width / 2;
	var _y2 = _y1 + 32;
	var _mouse_caixa = point_in_rectangle(mouse_x - meu_x, mouse_y - meu_y, _x1, _y1, _x2, _y2);
	//Avisando para fazer o efeito de coprar na caixa
	efeito_comprar = _mouse_caixa;
	if (_mouse_caixa)
	{
		//Checando sea pessoa clicou comprar
		if(_mouse_click)
		{
			//Checando se a pessoa tem o dinheiro para comprar o item
			if(global.gold >= custo)
			{
				comprar();
			}
		}
	}	
}






