// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações

// configurando o tempo do jogo
// definindo os frames do jogo (fps) 

#macro FRAMES 60
game_set_speed(FRAMES, gamespeed_fps);

//Usando o deltatime para ajustar o tempo do meu jogo
// Velocidade do jogo
global.game_spd = 1;
//Definindo o framerate do jogo
global.framerate = global.game_spd / FRAMES;
//Identificando a duração de 1 segundo no jogo
global.gamesegundos = 0;

//Função para atualizar o tempo do jogo
function atualiza_tempo()
{
	//pegando o tempo em segundos
	global.gamesegundos = delta_time / 1000000;
	global.framerate = global.gamesegundos * global.game_spd;
}	

global.exibe_managers = false;

//Sistema de Dinheiro
global.gold = 4;
global.gold_seg = 0;


//Informações dos managers
global.manager = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0,];

//lista dos produtos
global.produtos = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0,];
global.produtos_info = array_create(10, 0);

global.idioma = 0;













