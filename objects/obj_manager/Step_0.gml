/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _mouse_sobre = position_meeting(mouse_x, mouse_y, id);
var _mouse_click = mouse_check_button_pressed(mb_left);

if(_mouse_sobre && comprado == false)
{
	if(_mouse_click)
	{
		//Checando se a pessoa pode me comprar
		if(global.gold >= custo)
		{
			global.gold -= custo;
			//Avisndo qu eu fui vendido
			global.manager[indice] = true;
			comprado = true;
			
			//Avisando ao produto que ele deve fazer e fazer sempre
			global.produtos[indice].fazer = true;
			global.produtos[indice].Tenho_manager = true;
		}
	}
}











