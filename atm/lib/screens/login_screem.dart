import 'package:atm/helpers/api_response.dart';
import 'package:atm/models/client.dart';
import 'package:atm/models/user_manager.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key key}) : super(key: key);
  final _controllerEmail = TextEditingController();

  final _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormFieldWidget(
              hint: "E-mail",
              icon: Icons.person,
              controller: _controllerEmail,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormFieldWidget(
              hint: "Password",
              icon: Icons.vpn_key,
              controller: _controllerPassword,
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              height: 49,
              child: RaisedButton(
                highlightColor: Colors.white30,
                elevation: 3,
                color: Colors.white,
                textColor: Colors.blue,
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
            ),
          ],
        ),
      ),
    );
  }

  _onClikLogin() async {
    // bool formOk = _formKey.currentState.validate();

    // if (!formOk) {
    //   return;
    // }

    String email = _controllerEmail.text;
    String password = _controllerPassword.text;

    ApiResponse apiResponse = await UserManager.login("eliezer@gmail.com", "eliezer");

    if (apiResponse.ok) {
      Client user = apiResponse.result;
      print(user);
    } else {
      print(apiResponse.msg);
    }
  }
}

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget(
      {Key key,
      this.hint,
      this.icon = Icons.accessible,
      this.obscure = false,
      this.controller})
      : super(key: key);
  final String hint;
  final IconData icon;
  final bool obscure;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              icon,
              color: Colors.blueAccent,
            ),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding: EdgeInsets.all(20),
            hintText: hint,
            hintStyle: TextStyle(color: Colors.blue)),
      ),
    );
  }
}
