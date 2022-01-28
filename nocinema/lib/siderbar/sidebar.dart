import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nocinema/bloc_navigation/bloc_navigation.dart';
import 'package:nocinema/search/search_delegate.dart';
import 'package:nocinema/theme/theme.dart';
import 'package:nocinema/utils/custom_clipper.dart';
import 'package:provider/provider.dart';

import 'package:rxdart/rxdart.dart';

import 'menu_item.dart';

class SideBar extends StatefulWidget {
  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<SideBar> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late StreamController<bool> isSidebarOpenedStramController;
  late Stream<bool> isSidebarOpenedStream;
  late StreamSink<bool> isSidebarOpenedSink;
  bool isSidebarOpened = true;
  final _animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStramController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStramController.stream;
    isSidebarOpenedSink = isSidebarOpenedStramController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStramController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final appTheme = context.watch<ThemeChanger>();
    final secondary = appTheme.currentTheme?.colorScheme.secondary;
    return StreamBuilder(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, AsyncSnapshot<bool?> isSiderBarOpenedAsync) {
        late final value;

        if (isSiderBarOpenedAsync.data != null) {
          value = isSiderBarOpenedAsync.data;
        }

        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: value ? 0 : -screenWidth,
          right: value ? 0 : screenWidth - 45,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: screenHeight,
                  color: appTheme.darkTheme ? Colors.grey[800] : Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 100),
                        ListTile(
                          title: const Text('NOCINEMA',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w800)),
                          leading: CircleAvatar(
                            backgroundColor: secondary,
                            child: const Icon(
                              Icons.movie_filter_outlined,
                              color: Colors.white,
                            ),
                            radius: 40,
                          ),
                        ),
                        Divider(
                          height: 64,
                          thickness: 0.5,
                          indent: 32,
                          endIndent: 32,
                          color: secondary,
                        ),
                        MenuItem(
                          icon: Icons.play_arrow,
                          title: "Exibição",
                          onTap: () {
                            onIconPressed();
                            BlocProvider.of<NavigationBloc>(context).add(
                                NavigationEvents.exhibitionScreenChickedEvent);
                          },
                        ),
                        MenuItem(
                          icon: Icons.movie,
                          title: "Populares ",
                          onTap: () {
                            onIconPressed();
                            BlocProvider.of<NavigationBloc>(context).add(
                                NavigationEvents.popularScreenChickedEvent);
                          },
                        ),
                        MenuItem(
                          icon: Icons.card_giftcard,
                          title: "Brevemente",
                          onTap: () {
                            onIconPressed();
                            BlocProvider.of<NavigationBloc>(context).add(
                                NavigationEvents.brieflyScreenChickedEvent);
                          },
                        ),
                        MenuItem(
                          icon: Icons.search,
                          title: "Filtros",
                          onTap: () {
                            onIconPressed();
                            showSearch(
                                context: context,
                                delegate: DataSerach(),
                                query: '');
                          },
                        ),
                        Divider(
                          height: 64,
                          thickness: 0.5,
                          indent: 32,
                          endIndent: 32,
                          color: secondary,
                        ),
                        ListTile(
                          title: const Text("Modo Escuro",
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 26,
                              )),
                          leading: Switch.adaptive(
                            value: appTheme.darkTheme,
                            onChanged: (bool value) {
                              appTheme.darkTheme = value;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0, -0.9),
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuclipper(),
                    child: Container(
                      width: 35,
                      height: 110,
                      color:
                          appTheme.darkTheme ? Colors.grey[800] : Colors.white,
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                          progress: _animationController.view,
                          icon: AnimatedIcons.menu_close,
                          size: 25),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
