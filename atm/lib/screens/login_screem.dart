import 'package:atm/helpers/api_response.dart';
import 'package:atm/models/client.dart';
import 'package:atm/models/user_manager.dart';
import 'package:atm/screens/home_screen.dart';
import 'package:atm/widgets/bottom_nav_bar.dart';
import 'package:atm/widgets/messenger.dart';
import 'package:atm/widgets/textformfield.dart';
import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            !_loading
                ? Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 420,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(550),
                        ),
                      ),
                    ),
                  )
                : Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 420,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(550),
                        ),
                      ),
                    ),
                  ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 40,
                            color: !_loading ? Colors.indigo : Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 20,
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
                    !_loading
                        ? Container(
                            height: 49,
                            child: RaisedButton(
                              highlightColor: Colors.white30,
                              elevation: 7,
                              color: Colors.white,
                              textColor: Colors.indigo,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                              onPressed: _onClikLogin,
                              child: Text("Entrar"),
                            ),
                          )
                        : Center(child: CircularProgressIndicator())
                  ],
                ),
              ),
            )
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

    ApiResponse apiResponse = await UserManager.login(email, password);

    if (apiResponse.ok) {
      Client user = apiResponse.result;
      if (user != null) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => BottomNavBar(),
        ));
      }
    } else {
      messenger(context, apiResponse.msg);
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
}
