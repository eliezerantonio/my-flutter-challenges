import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nicolau/bloc_navigation/bloc_navigation.dart';
import 'package:nicolau/providers/movie_provider.dart';
import 'package:nicolau/screens/noconnection/noconnection.dart';
import 'package:nicolau/siderbar/sidebar.dart';

class SidebarLayout extends StatefulWidget {
  @override
  State<SidebarLayout> createState() => _SidebarLayoutState();
}

class _SidebarLayoutState extends State<SidebarLayout> {
  bool _isConnectionSuccessful = true;

  @override
  initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 100), () {
      _tryConnection();
    });
  }

  Future<void> _tryConnection() async {
    context.read<MoviesProvider>();
    try {
      final response = await InternetAddress.lookup('www.themoviedb.org');
      print(response);
      setState(() {
        _isConnectionSuccessful = response.isNotEmpty;
        print(_isConnectionSuccessful);
      });
    } on SocketException catch (e) {
      print(" este e o erro $e");

      _isConnectionSuccessful = false;
      setState(() {});
      print("estou no erro $_isConnectionSuccessful");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: _isConnectionSuccessful
          ? BlocProvider<NavigationBloc>(
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
            )
          : NoConnection(tryConnection: _tryConnection),
    ));
  }
}
