import 'package:coffee/screens/first_screen.dart';
import 'package:coffee/screens/home_screen.dart';
import 'package:coffee/widgets/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:hidden_drawer_menu/model/item_hidden_menu.dart';
import 'package:hidden_drawer_menu/model/screen_hidden_drawer.dart';

class HomeDrawer extends StatefulWidget {
  HomeDrawer({Key key}) : super(key: key);

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  List<ScreenHiddenDrawer> itens = new List();

  @override
  void initState() {
    itens.add(
      new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Home",
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          colorLineSelected: Colors.teal,
        ),
        HomeScreen(),
      ),
    );

    itens.add(
      new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Carrinho",
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          colorLineSelected: Colors.orange,
        ),
        FirstScreen(),
      ),
    );
    itens.add(
      new ScreenHiddenDrawer(
          new ItemHiddenMenu(name: "Configurações"), AlertDialog()),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: HiddenDrawerMenu(
        tittleAppBar: LogoWidget(logo: "white"),
        backgroundColorMenu: Theme.of(context).primaryColor,
        elevationAppBar: 0,
        backgroundColorAppBar: Theme.of(context).primaryColor,
        screens: itens,
        isTitleCentered: true,
        curveAnimation: Curves.easeInOutQuart,
        //    typeOpen: TypeOpen.FROM_RIGHT,
        //    disableAppBarDefault: false,
        //    enableScaleAnimin: true,
        //    enableCornerAnimin: true,
        slidePercent: 60.0,
        verticalScalePercent: 80.0,
        //    contentCornerRadius: 10.0,
        //    iconMenuAppBar: Icon(Icons.menu),
        //    backgroundContent: DecorationImage((image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
        //    whithAutoTittleName: true,
        //    styleAutoTittleName: TextStyle(color: Colors.red),
        //    actionsAppBar: <Widget>[],
        //    backgroundColorContent: Colors.blue,
        //    elevationAppBar: 4.0,
        //    tittleAppBar: Center(child: Icon(Icons.ac_unit),),
        enableShadowItensMenu: true,
        backgroundMenu: DecorationImage(
          image: ExactAssetImage(
            'images/principal.png',
            scale: 0.5,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
