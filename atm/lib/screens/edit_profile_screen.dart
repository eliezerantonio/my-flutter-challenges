import 'package:atm/user/user_manager.dart';
import 'package:atm/widgets/custom_button.dart';
import 'package:atm/widgets/custom_text_form.dart';
import 'package:atm/widgets/custom_text_form2.dart';
import 'package:atm/widgets/info_profile_widget.dart';
import 'package:atm/widgets/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final user = context.watch<UserManager>().user;
    final primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Perfil"),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Align(
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  image: DecorationImage(
                    image: NetworkImage(user.pic),
                  ),
                ),
                child: Container(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 7),
            Text(
              user.name,
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 7),
            Text(
              "Editar Perfil",
            ),
            SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 20),
                Text("Nome"),
                CustomTextForm2(
                  black: true,
                  icon: Icons.person,
                  initialValue: user.name,
                ),
                SizedBox(height: 20),
                Text("E-mail"),
                CustomTextForm2(
                  black: true,
                  icon: Icons.email,
                  initialValue: user.email,
                ),
                SizedBox(height: 20),
                Text("Telefone"),
                CustomTextForm2(
                  black: true,
                  icon: Icons.phone,
                  initialValue: user.phone,
                ),
                SizedBox(height: 20),
              ],
            ),
            Spacer(),
            Container(
              width: 350,
              child: CustomButton(
                onPressed: () {},
                text: "Salvar",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
