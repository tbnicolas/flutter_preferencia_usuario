import 'package:flutter/material.dart';
import 'package:flutter_preferencia_usuario/src/pages/home_page.dart';
import 'package:flutter_preferencia_usuario/src/pages/settings_page.dart';
class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          new DrawerHeader(
            child: new Container(),
            decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage('assets/menu-img.jpg'),
                  fit: BoxFit.cover
              ),
            ),
          ),
          new ListTile(
            leading: new Icon(Icons.pages, color: Colors.blue,),
            title: new Text('Home'),
            onTap: ()=>Navigator.pushReplacementNamed(context, HomePage.routeName),
          ),
          new ListTile(
            leading: new Icon(Icons.party_mode, color: Colors.blue,),
            title: new Text('Party Mode'),
            onTap: (){},
          ),
          new ListTile(
            leading: new Icon(Icons.people, color: Colors.blue,),
            title: new Text('People'),
            onTap: (){},
          ),
          new ListTile(
            leading: new Icon(Icons.settings, color: Colors.blue,),
            title: new Text('Settings'),
            onTap: (){
              //Navigator.pop(context)
              Navigator.pushReplacementNamed(context, SettingsPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
