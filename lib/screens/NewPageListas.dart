import 'package:flutter/material.dart';

class NewPageListas extends StatefulWidget {
  final Map<String, List<String>> dicionario;

  NewPageListas({required this.dicionario});

  @override
  _NewPageListasState createState() => _NewPageListasState();
}

class _NewPageListasState extends State<NewPageListas> {
  Map<String, List<bool>> _checkboxes = {};

  @override
  void initState() {
    super.initState();
    widget.dicionario.forEach((key, value) {
      _checkboxes[key] = List<bool>.filled(value.length, false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listas"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: widget.dicionario.keys.length,
        itemBuilder: (context, index) {
          String nomeLista = widget.dicionario.keys.elementAt(index);
          List<String> tarefas = widget.dicionario[nomeLista]!;

          return ExpansionTile(
            title: Text(nomeLista),
            children: [
              ...tarefas.asMap().entries.map((entry) {
                int i = entry.key;
                String tarefa = entry.value;

                return ListTile(
                  title: Row(
                    children: [
                      Checkbox(
                        value: _checkboxes[nomeLista]?[i] ?? false,
                        onChanged: (bool? value) {
                          setState(() {
                            _checkboxes[nomeLista]?[i] = value ?? false;
                          });
                        },
                      ),
                      Expanded(child: Text(tarefa)),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () async {
                          String? novaTarefa = await _editarTarefa(context, tarefa);
                          if (novaTarefa != null && novaTarefa.isNotEmpty) {
                            setState(() {
                              widget.dicionario[nomeLista]?[i] = novaTarefa;
                            });
                          }
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            widget.dicionario[nomeLista]?.removeAt(i);
                            _checkboxes[nomeLista]?.removeAt(i);
                          });
                        },
                      ),
                    ],
                  ),
                );
              }).toList(),
              ListTile(
                title: Text("Editar Nome da Lista"),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () async {
                    String? novoNome = await _editarNomeLista(context, nomeLista);
                    if (novoNome != null && novoNome.isNotEmpty) {
                      setState(() {
                        widget.dicionario[novoNome] = widget.dicionario[nomeLista]!;
                        widget.dicionario.remove(nomeLista);
                      });
                    }
                  },
                ),
              ),
              ListTile(
                title: Text("Excluir Lista"),
                trailing: IconButton(
                  icon: Icon(Icons.delete_forever),
                  onPressed: () {
                    setState(() {
                      widget.dicionario.remove(nomeLista);
                    });
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<String?> _editarTarefa(BuildContext context, String tarefa) {
    TextEditingController controller = TextEditingController(text: tarefa);
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Editar Tarefa"),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: "Novo nome da tarefa"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, controller.text);
              },
              child: Text("Salvar"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, null);
              },
              child: Text("Cancelar"),
            ),
          ],
        );
      },
    );
  }

  Future<String?> _editarNomeLista(BuildContext context, String nomeLista) {
    TextEditingController controller = TextEditingController(text: nomeLista);
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Editar Nome da Lista"),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: "Novo nome da lista"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, controller.text);
              },
              child: Text("Salvar"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, null);
              },
              child: Text("Cancelar"),
            ),
          ],
        );
      },
    );
  }
}
