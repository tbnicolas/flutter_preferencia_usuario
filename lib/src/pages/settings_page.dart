import 'package:flutter/material.dart';
import 'package:flutter_preferencia_usuario/src/share_prefs/preferencias_usuario.dart';
import 'package:flutter_preferencia_usuario/src/widgets/menu_widgets.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario;
  int _genero = 1;
  //String _nombre = 'Pedro';

  TextEditingController _textEditingController;

  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    prefs.ultimaPagina = SettingsPage.routeName;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _textEditingController = new TextEditingController(text:  prefs.nombreUsuario);

  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Ajustes'),
          backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.cyan,
        ),
        drawer: new MenuWidget(),
        body: new ListView(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.all(5.0),
              child: new Text('Settings',
                  style: new TextStyle(
                      fontSize: 45.0, fontWeight: FontWeight.bold)),
            ),
            new Divider(),

            new SwitchListTile(
                value: _colorSecundario,
                title: new Text('Color Secundario'),
                onChanged: (value){
                  setState(() {
                    prefs.colorSecundario = value;
                    _colorSecundario = value;
                  });

                }
            ),

            new RadioListTile(
                value: 1,
                groupValue: _genero,
                title: new Text('Masculino'),
                onChanged: _setSelectedRadio
            ),
            new RadioListTile(
                value: 2,
                groupValue: _genero,
                title: new Text('Femenino'),
                onChanged:_setSelectedRadio
            ),

            new Divider(),

            new Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: new TextField(
                controller: _textEditingController,
                decoration: new InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Nombre de la persona usando el telefono'
                ),
                onChanged: (value){
                    prefs.nombreUsuario = value;

                },
              ),
            )


          ],
        )
    );
  }

   _setSelectedRadio(int value) {
    prefs.genero = value;
    _genero = value;
    setState(() {});

    /*prefs.setInt('genero', value);
    _genero = value;
    setState(() {

    });*/

  }
}
