import 'package:http/http.dart' as http;
import 'dart:convert';

const URL_BASE = "https://api.github.com/users/";

class Api{

  Future<Map> pesquisa(String user) async {

    http.Response response;
    String url = "$URL_BASE$user";
    print(url);
    response = await http.get(url);

    if(response.statusCode == 200){
      var dadosJson = json.decode(response.body);
      print("Deu Certo!" + dadosJson["login"].toString());
      return dadosJson;
    }else{
      print("Deu Erro! ${response.statusCode.toString()}");
      Map<String, dynamic> erro;
      erro["login"] = "usuario não encontrado!";
      return erro;
    }

  }

}