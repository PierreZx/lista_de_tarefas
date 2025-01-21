import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewPageNovaLista extends StatefulWidget {
  final Function(String, List<String>) onSalvar;

  NewPageNovaLista({required this.onSalvar});

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
            TextField(
              controller: _nomecontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Informe o nome da lista',
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Informe as tarefas:",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            ..._buildTaskFields(),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _salvarLista,
              child: Text("Salvar"),
            ),
          ],
        ),
      ),
    );
  }


  void _salvarLista() {
    String nomeLista = _nomecontroller.text.trim();
    List<String> tarefas = [
      _tarefa1controller.text.trim(),
      _tarefa2controller.text.trim(),
      _tarefa3controller.text.trim(),
      _tarefa4controller.text.trim(),
      _tarefa5controller.text.trim(),
    ].where((tarefa) => tarefa.isNotEmpty).toList();

    if (nomeLista.isEmpty || tarefas.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Preencha o nome da lista e pelo menos uma tarefa!")),
      );
      return;
    }

    widget.onSalvar(nomeLista, tarefas);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Lista '$nomeLista' salva com sucesso!")),
    );

    _nomecontroller.clear();
    _tarefa1controller.clear();
    _tarefa2controller.clear();
    _tarefa3controller.clear();
    _tarefa4controller.clear();
    _tarefa5controller.clear();
  }


  List<Widget> _buildTaskFields() {
    return [
      TextField(
        controller: _tarefa1controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Informe a tarefa 1',
        ),
      ),
      SizedBox(height: 8),
      TextField(
        controller: _tarefa2controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Informe a tarefa 2',
        ),
      ),
      SizedBox(height: 8),
      TextField(
        controller: _tarefa3controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Informe a tarefa 3',
        ),
      ),
      SizedBox(height: 8),
      TextField(
        controller: _tarefa4controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Informe a tarefa 4',
        ),
      ),
      SizedBox(height: 8),
      TextField(
        controller: _tarefa5controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Informe a tarefa 5',
        ),
      ),
    ];
  }
}
