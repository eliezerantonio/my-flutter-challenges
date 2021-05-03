import 'package:atm/helpers/api_response.dart';
import 'package:atm/helpers/nav.dart';
import 'package:atm/user/user.dart';
import 'package:atm/user/user_manager.dart';
import 'package:atm/screens/home_screen.dart';
import 'package:atm/widgets/bottom_nav_bar.dart';
import '../widgets/logo_widget.dart';
import 'package:atm/widgets/messenger.dart';
import 'package:atm/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _controllerEmail = TextEditingController();

  final _controllerPassword = TextEditingController();

  bool _loading = false;

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();

     Future<User> client = context.read<UserManager>().getUser();
    client.then((User value) {
      if (value != null) {
         Navigator.pushReplacement(context, _crearRuta(BottomNavBar()));
       } else {
        print("oi eliezer");
       }
     });
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 3000),
              alignment: !_loading ? Alignment.bottomRight : Alignment.topRight,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 1000),
                height: !_loading ? 420 : 0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: !_loading
                      ? BorderRadius.only(
                          topLeft: Radius.circular(550),
                        )
                      : BorderRadius.circular(550),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    TextFormFieldWidget(
                      hint: "E-mail",
                      icon: Icons.person,
                      controller: _controllerEmail,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormFieldWidget(
                      hint: "Password",
                      icon: Icons.vpn_key,
                      controller: _controllerPassword,
                      obscure: true,
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 3000),
                      height: 49,
                      child: !_loading
                          ? RaisedButton(
                              highlightColor: Colors.white30,
                              elevation: 7,
                              color: Colors.white,
                              textColor: primaryColor,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                              onPressed: _onClikLogin,
                              child: Text(
                                "Entrar",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ))
                          : Align(
                              alignment: Alignment.centerRight,
                              child: Center(
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: primaryColor,
                                  ),
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: LogoWidget(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onClikLogin() async {
    bool formOk = fieldsValidador();

    if (!formOk) {
      return;
    }
    setState(() {
      _loading = true;
    });
    String email = _controllerEmail.text;
    String password = _controllerPassword.text;
    await Future.delayed(Duration(seconds: 1));
    ApiResponse apiResponse =
        await context.read<UserManager>().login(email, password);

    if (apiResponse.ok) {
      User user = apiResponse.result;
      if (user != null) {
        Navigator.pushReplacement(context, _crearRuta(BottomNavBar()));

        return;
      }
    } else {
      messenger(context, apiResponse.msg, error: true);
    }
    setState(() {
      _loading = false;
    });
  }

  bool fieldsValidador() {
    String email = _controllerEmail.text;
    String password = _controllerPassword.text;
    if (email.trim().isEmpty || password.trim().isEmpty) {
      messenger(context, "Preencha Todos campos");
    } else if (!email.contains("@")) {
      messenger(context, "Preencha email valido");
    } else if (email.length < 4) {
      messenger(context, "E-mail muito curto");
    } else if (password.length < 6) {
      messenger(context, "senha muito curta");
    } else {
      return true;
    }

    return false;
  }

  Route _crearRuta(Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) =>
          widget,
      transitionDuration: Duration(seconds: 2),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation =
            CurvedAnimation(parent: animation, curve: Curves.elasticInOut);

        return ScaleTransition(
            child: child,
            scale:
                Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation));
      },
    );
  }
}
