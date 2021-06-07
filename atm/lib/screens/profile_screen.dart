import 'package:atm/helpers/nav.dart';
import 'package:atm/screens/edit_profile_screen.dart';
import 'package:atm/screens/login_screem.dart';
import 'package:atm/user/user.dart';
import 'package:atm/user/user_manager.dart';
import 'package:atm/widgets/info_profile_widget.dart';
import 'package:atm/widgets/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final user = context.watch<UserManager>().user;
    final primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              child: LogoWidget(),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "Perfil",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        elevation: 0,
        actions: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(user.pic),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                image: DecorationImage(
                  image: NetworkImage(user.pic),
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
              user.email,
              style: TextStyle(),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                push(context, EditProfileScreen());
              },
              child: InfoWidget(
                color: Colors.red,
                icon: Icons.person,
                text: "Editar Perfil",
              ),
            ),
            SizedBox(height: 22),
            InfoWidget(
              color: primaryColor,
              icon: Icons.lock_clock,
              text: "Historicos",
            ),
            SizedBox(height: 22),
            InfoWidget(
              color: Colors.blueAccent,
              icon: Icons.settings,
              text: "Notifications",
            ),
            SizedBox(height: 22),
            InfoWidget(
              color: Colors.purple,
              icon: Icons.share,
              text: "Partilhar",
            ),
            Spacer(),
            GestureDetector(
              onTap: () async {
                await context.read<User>().clear();
                push(context, LoginScreen(), replace: true);
              },
              child: InfoWidget(
                color: Colors.red,
                icon: Icons.exit_to_app,
                text: "Sair",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
