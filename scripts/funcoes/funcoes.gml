// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações

function convert_num(_num)
{
	//Retornando a string arrumadinha já
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
	var _str2 = "R$ " + string_format(_custo2, 0, 2) + _valores[_i];
	return _str2;
	
}