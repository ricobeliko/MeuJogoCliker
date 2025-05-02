// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações

function convert_num(_num)
{
	//Retornando a string arrumadinha já
	var _simbolo = "R$ ";
	switch(global.idioma)
	{
		case 1: _simbolo = "$ "; break;	
		case 2: _simbolo = "$$$ "; break;	
	}
	var _custo2 = _num;
	var _valores = ["", "K", "M", "B", "T", "q", "Q"];
	var _i = 0;

	//Sempre que o valor for maior do que 1000, eu tiro 3 zeros dele
	while(_custo2 > 1000)
	{
		//Tiro 3 zeros dele
		_custo2 /= 1000;
		
		//Sempre que eu rodei isso, eu subo para a proxima casa
		_i++;
	}
	var _str2 = _simbolo + string_format(_custo2, 0, 2) + _valores[_i];
	return _str2;
}

//Salvando o jogo
function save_game()
{
	//Abriando o arquido
	var _file = file_text_open_write("save.json");
	
	//Sabendo quais produtos ja foram comprados 
	//Criando um vetor para saber quantos produtos ao todo eu tenho
	var _produtos = array_create(array_length(global.produtos), 0);
	
	
	//Ajustando as informações de um outro jeito
	for (var i = 0; i < array_length(_produtos); i++)
	{
		//Criando a estrutura para salvar o array
		var _estrura =
		{
			comprado : global.produtos[i].comprado,
			level	 : global.produtos[i].level,
			Tenho_manager : global.produtos[i].Tenho_manager
		};
		
		//Colocando a estrutura no array iunformações
		_produtos[i] = _estrura;
	}
	
	////Criando um método para criar a estrutura com os dados de cada produtos
	//var _salva_dados = function(_elemento, _indice)
	//{
	//	//Pegando as informações do elemento
	//	_elemento = 
	//	{
	//		comprado : global.produtos[_indice].comprado,
	//		level	 : global.produtos[_indice].level,
	//		Tenho_manager : global.produtos[_indice].Tenho_manager
	//	};
		
	//	return _elemento;
	//}
	
	////Iterar pelo array e criar a estrutura dcom os dados
	//var _produtos = array_map(_qtd_prod, _salva_dados);
	
	//Salvando o dinheiro por segundo
	
	// pegando o momento em que o jogo foi fechado
	var _tempo_atual = date_current_datetime();
	//var _dif = date_second_span)_tempo_atual, _tempo2);
	
	
	//Criando a estrutura do que vai ser salvo
	var _struct =
	{
		gold : global.gold,
		produtos : _produtos,
		gold_seg : global.gold_seg,
		tempo : _tempo_atual
	};
	
	//Convertendo a sturct em uma string
	var _string = json_stringify(_struct);
	
	//Mandando o arquivo salvar
	file_text_write_string(_file, _string);
	
	//Fechando o arquivo
	file_text_close(_file);
}


//Carregando o jogo
function load_game()
{
	//Abriando o arquivo se o arquivo existe
	if(file_exists("save.json"))
	{
		
		var _file = file_text_open_read("save.json");
		
		//Pegando as inoformações od arquivo
		var _string = file_text_read_string(_file);
		
		//Convertendo as stirng em uma struct
		var _struct = json_parse(_string);
		
		//Passando o gold para o jogo
		global.gold = _struct.gold;
		
		//Passando as informações dos produtos para o jogo
		global.produtos_info = _struct.produtos;
		
		//Sabendo quanto dinheiro eu fiz desde que o jogo foi fechado
		//Checando quanto tempo passou
		var _tempo = date_current_datetime();
		var _dif = date_second_span(_struct.tempo, _tempo);
		var _dinheiro_feito = _dif * _struct.gold_seg;
		var _str = convert_num(_dinheiro_feito);
		
		if (global.idioma == 0)
		{
			show_message("Equanto você esta fora seus Gerentes trabalharam: " + string(_str));
		}
		else if (global.idioma == 1)
		{
			show_message("While you were away your Managers worked: " + string(_str));	
		}
		
		//Atualizando o gold
		global.gold += _dinheiro_feito;
		
			//Fechando o arquivo
		file_text_close(_file);
	}
}

function carrega_dados(_idioma = 0)
{
	
	var _arquivo = "dados.json";
	switch(_idioma)
	{
		case 1: _arquivo = "dados_en.json"; break;	
		case 2: _arquivo = "dados_es.json"; break;	
		// ATENÇAO AQUI EU COLOCO AS TRADUÇÕES QUE EU QUISER
		// CASE 3 CASE 4 E ASSIM POR DIANTE
	}
	
	//Abrindo o meu arquivo json que foi importado

	var _file =  file_text_open_read(_arquivo);
	var _txt = "";
	//Rodando pelo meu file lendo todas as linhas até ele acabar
	//criando um loop
	while(true)
	{
		//Se ele chegou no final do arquivo ele sai do loop
		if(file_text_eof(_file))
		{
			//Saindo do loop
			break;
		}
		else
		{
			var _linha = file_text_readln(_file);
			_txt += _linha;
		}		
	}
	//Convertendo o texto em struct
	global.struct_produtos = json_parse(_txt).items; 

	//Fechando o arquivo
	file_text_close(_file);
}









