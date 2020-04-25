import 'package:flutter/material.dart';

import 'home.dart';

class Login extends StatefulWidget {
  var cameras;
  Login(this.cameras);
  @override
  _LoginState createState() => _LoginState();
}

  TextEditingController _userController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Live Login"),
        backgroundColor: Colors.greenAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: <Widget>[
            Icon(Icons.account_circle, size: 150, color: Colors.greenAccent,),

            Padding(
              padding: EdgeInsets.all(12),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Usuário',
                  hintText: 'Digite seu usuário',
                  border: OutlineInputBorder()
                ),
                controller: _userController,
              ),
              ),

              Padding(
              padding: EdgeInsets.all(12),
              child: TextField(
                keyboardType: TextInputType.number,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  hintText: 'Digite sua senha',
                  border: OutlineInputBorder()
                ),
                controller: _passwordController,
              ),
              ),

              RaisedButton(
                color: Colors.greenAccent,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(22, 8, 22, 8),
                elevation: 0.5,
                child: Text(
                  "Entrar",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize:28,
                    color: Colors.white
                  ),
                ),
                onPressed: (){
                  print("pressionado");
                  if(_userController.text == 'teste' && _passwordController.text == '123'){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Home(nome: _userController.text, cameras: widget.cameras,)
                        ));

                        print("Sucess");
                  }else{
                    print("Failed");
                    showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text("Login Falhou"),
                          content: Text("Você digitou algo errado, confira seu login."),
                          actions: <Widget>[
                            FlatButton(onPressed: () => Navigator.pop(context), child: Text("Fechar"))
                          ],
                        );
                      }
                    );
                  }
                }
              )

          ],
        ),
      ),
      )
    );
  }
}