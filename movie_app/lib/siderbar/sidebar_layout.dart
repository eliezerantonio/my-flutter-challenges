import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nicolau/bloc_navigation/bloc_navigation.dart';
import 'package:nicolau/screens/movie_screen/exhibition_screen.dart';
import 'package:nicolau/siderbar/sidebar.dart';

class SidebarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: BlocProvider<NavigationBloc>(
        create: (_) => NavigationBloc(),
        child: Stack(
          children: [
            BlocBuilder<NavigationBloc, NavigationStates>(
              builder: (context, navigationState) {
                return navigationState as Widget;
              },
            ),
            SideBar(),
          ],
        ),
      ),
    ));
  }
}
