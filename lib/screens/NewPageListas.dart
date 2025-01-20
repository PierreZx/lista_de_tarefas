import 'package:flutter/material.dart';

class NewPageListas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listas"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.map),
                    title: Text('Mapa'),
                  ),
                  ListTile(
                    leading: Icon(Icons.photo_album),
                    title: Text('Album'),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('Fone'),
                  ),
                ],
              ),
            ),
          );
        }
}
