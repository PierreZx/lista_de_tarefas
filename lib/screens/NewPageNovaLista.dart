import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewPageNovaLista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text("Nova Lista"),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Aqui você coloca o que deve acontecer ao clicar no ícone
              print("Ícone pressionado!");
            },
          ),
        ],
      ),
      body: Center(
        child: widgetTextField(),
      ),
    );
  }
  
widgetTextField() {
    return TextField(
      decoration:
          InputDecoration(border: InputBorder.none,
          hintText: 'Informe o nome da lista'),
    );
  }
}
