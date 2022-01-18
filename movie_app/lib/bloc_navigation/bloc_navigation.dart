import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nicolau/screens/briefly/briefly_screen.dart';
import 'package:nicolau/screens/exhibition/exhibition_screen.dart';
import 'package:nicolau/screens/movie_screen/movies_screen.dart';

enum NavigationEvents {
  HomeScreenChickedEvent,
  ExhibitionScreenChickedEvent,
  BrieflyScreenChickedEvent
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  NavigationBloc() : super(const HomeScreen()) {
    on<NavigationEvents>(
      (event, emit) {
        switch (event) {
          case NavigationEvents.HomeScreenChickedEvent:
            emit(const HomeScreen());
            break;
          case NavigationEvents.ExhibitionScreenChickedEvent:
            emit( ExhibitionScreen());
            break;

          case NavigationEvents.BrieflyScreenChickedEvent:
             BrieflyScreen();
            break;
        }
      },
    );
  }
}
