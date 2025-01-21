import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewPageNovaLista extends StatefulWidget {
  @override
  _NewPageNovaListaState createState() => _NewPageNovaListaState();
}

class _NewPageNovaListaState extends State<NewPageNovaLista> {
  TextEditingController _nomecontroller = TextEditingController();
  TextEditingController _tarefa1controller = TextEditingController();
  TextEditingController _tarefa2controller = TextEditingController();
  TextEditingController _tarefa3controller = TextEditingController();
  TextEditingController _tarefa4controller = TextEditingController();
  TextEditingController _tarefa5controller = TextEditingController();
  
  // Dicionário para armazenar a lista de tarefas por nome da lista
  Map<String, List<String>> dicionarioDeListas = {};

  @override
  void dispose() {
    _nomecontroller.dispose();
    _tarefa1controller.dispose();
    _tarefa2controller.dispose();
    _tarefa3controller.dispose();
    _tarefa4controller.dispose();
    _tarefa5controller.dispose();
    super.dispose();
  }

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
              print("Ícone pressionado!");
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Informe o nome da lista:",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            widgetTextField(),
            SizedBox(height: 16),
            Text(
              "Informe as tarefas:",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            widgetTextFieldTarefa1(), // Campo de tarefa 1
            widgetTextFieldTarefa2(), // Campo de tarefa 2
            widgetTextFieldTarefa3(), // Campo de tarefa 3
            widgetTextFieldTarefa4(), // Campo de tarefa 4
            widgetTextFieldTarefa5(), // Campo de tarefa 5
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String nomeLista = _nomecontroller.text;
                List<String> tarefas = [
                  _tarefa1controller.text,
                  _tarefa2controller.text,
                  _tarefa3controller.text,
                  _tarefa4controller.text,
                  _tarefa5controller.text,
                ];

                dicionarioDeListas[nomeLista] = tarefas;

                print("Nome da Lista: $nomeLista");
                print("Tarefas: $tarefas");
                print("Dicionário Atual: $dicionarioDeListas");
              },
              child: Text("Salvar"),
            ),
          ],
        ),
      ),
    );
  }

  widgetTextField() {
    return TextField(
      controller: _nomecontroller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Informe o nome da lista',
      ),
    );
  }

  widgetTextFieldTarefa1() {
    return TextField(
      controller: _tarefa1controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Informe a tarefa 1',
      ),
    );
  }

  widgetTextFieldTarefa2() {
    return TextField(
      controller: _tarefa2controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Informe a tarefa 2',
      ),
    );
  }

  widgetTextFieldTarefa3() {
    return TextField(
      controller: _tarefa3controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Informe a tarefa 3',
      ),
    );
  }

  widgetTextFieldTarefa4() {
    return TextField(
      controller: _tarefa4controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Informe a tarefa 4',
      ),
    );
  }

  widgetTextFieldTarefa5() {
    return TextField(
      controller: _tarefa5controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Informe a tarefa 5',
      ),
    );
  }
}
