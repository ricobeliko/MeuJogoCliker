/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// chegando se ja fui comprardo
comprado = global.manager[indice];

desenha_manager = function()
{
	draw_self();
	//Desenhando o meu custo
	//Alinhando meu texto
	draw_set_halign(1);
	draw_set_valign(1);
	//deixando o teto agradavél
	var _str = "R$ " + string_format(custo, 0, 2);
	var _txt = comprado == true ? "Operando!" : _str

	draw_text(x + sprite_width / 2 , y, _txt);
	//Resetadno o alinhamento do meu texto
	draw_set_halign(-1);
	draw_set_valign(-1);	
}








