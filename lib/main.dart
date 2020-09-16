import 'package:flutter/material.dart';
import 'package:flutter_preferencia_usuario/src/pages/home_page.dart';
import 'package:flutter_preferencia_usuario/src/pages/settings_page.dart';
import 'package:flutter_preferencia_usuario/src/share_prefs/preferencias_usuario.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias',
      initialRoute: prefs.ultimaPagina,
      routes: {
        HomePage.routeName : (BuildContext context)=> new HomePage(),
        SettingsPage.routeName : (BuildContext context)=> new SettingsPage(),

      },
    );
  }
}


