import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/screens/NewPageListas.dart';
import 'package:lista_de_tarefas/screens/NewPageNovaLista.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _indiceAtual = 0;

  Map<String, List<String>> dicionarioDeListas = {};

  @override
  Widget build(BuildContext context) {
    final List<Widget> _telas = [
      NewPageNovaLista(
        onSalvar: (String nomeLista, List<String> tarefas) {
          setState(() {
            dicionarioDeListas[nomeLista] = tarefas;
          });
        },
      ),
      NewPageListas(dicionario: dicionarioDeListas),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Gerenciador de Tarefas"),
        backgroundColor: Colors.blue,
      ),
      body: _telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Nova Lista de tarefas",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: "Suas listas de tarefas",
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }
}
