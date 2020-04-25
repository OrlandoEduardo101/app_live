
import 'package:app_live/api.dart';
import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {

  TextEditingController _userController = TextEditingController();
  String _user = "#";
  var perfil;
  List dados;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                  SizedBox(
                    width: 300,
                    child: TextField(
                    scrollPadding: EdgeInsets.all(12),
                    decoration: InputDecoration(
                      labelText: "Digite um usuario do GitHub"
                    ),
                    controller: _userController,
                  ),
                  ),
                  GestureDetector(
                    child: Icon(Icons.search),
                    onTap: (){
                      setState(() {
                        print("Pesquisar");
                        _user = _userController.text;
                      });
                    },
                  )
          ],
          ),

          Container(
            padding: EdgeInsets.only(top: 12),

            child: FutureBuilder(
              future: Api().pesquisa(_user),
              builder: (context, snapshot){
                String resultado;
              
                switch(snapshot.connectionState){

                    case ConnectionState.none:
                      print("none");
                      break;
                    
                    case ConnectionState.waiting:
                     print("Waiting");
                     resultado = "Loading...";
                     break;

                    case ConnectionState.active:
                      print("Active");
                      break;

                    case ConnectionState.done:
                      print("done");
                        if(snapshot.hasError){
                          print("Erro ${snapshot.error.toString()}");
                          return Center(
                            child: Text("Nada a ser exibido!!"),
                          );
                        }
                        else{
                          perfil = snapshot.data;
                          resultado = "${perfil["name"]}";
                          print(" $resultado ");
                          dados = [
                            "Nome: $resultado",
                            "Login: ${perfil["login"]}",
                            "ID: ${perfil["id"]}",
                            "Seguidores: ${perfil["followers"]}",
                            "Repositórios: ${perfil["public_repos"]}",
                            "Copanhia: ${perfil["company"]}"
                          ];
                        }
                      break;
                }

                return Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(90),
                        child: Image.network('${perfil["avatar_url"].toString()}',
                        width: 200, height: 200
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.separated(
                        itemCount: dados.length,
                        itemBuilder: (context, index){
                          return ListTile(
                            title: Text(dados[index]),
                          );
                        }, 
                        separatorBuilder: (context, index) => Divider()
                        )
                    )
                  ],
                );


              }
            ),
          ),

        ],
      ),
    );
  }
}