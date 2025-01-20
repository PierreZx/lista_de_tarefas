import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/screens/NewPageListas.dart';
import 'package:lista_de_tarefas/screens/NewPageNovaLista.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _indiceAtual = 0;
  final List<Widget> _telas = [
    NewPageNovaLista(),
    NewPageListas(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
