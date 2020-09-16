import 'package:flutter/material.dart';
import 'package:flutter_preferencia_usuario/src/share_prefs/preferencias_usuario.dart';
import 'package:flutter_preferencia_usuario/src/widgets/menu_widgets.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    prefs.ultimaPagina = HomePage.routeName;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Preferencia de Usuario'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.cyan,
      ),
      drawer: new MenuWidget(),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text('Color Secundario: ${prefs.colorSecundario}'),
          new Divider(),
          new Text('Genero: ${prefs.genero}'),
          new Divider(),
          new Text('Nombre usuario: ${prefs.nombreUsuario}'),
          new Divider(),
        ],
      ),
    );
  }


}
