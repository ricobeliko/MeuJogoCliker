/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Salvando o jogo
save_game();

show_debug_message("Jogo Salvo!");
// loop para salvar a cada 2 minutos
alarm[0] = (game_get_speed(gamespeed_fps) * 60) * 2;


