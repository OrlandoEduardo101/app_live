import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  var user;
  Inicio(this.user);
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
           Text("${widget.user}, Seja bem-vindo!"),
           Padding(
             padding: EdgeInsets.all(16),
             child: Image.asset("images/recode.png"),
             ),
             Padding(
             padding: EdgeInsets.all(16),
             child: Image.asset("images/pp.jpeg"),
             ),
             Text("Login Feito com Sucesso!")
          ],
        )
      ),
    );
  }
}