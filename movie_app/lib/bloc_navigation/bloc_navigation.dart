import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nicolau/screens/briefly/briefly_screen.dart';
import 'package:nicolau/screens/exhibition/popular_screen.dart';
import 'package:nicolau/screens/movie_screen/exhibition_screen.dart';

enum NavigationEvents {
  PopularScreenChickedEvent,
  ExhibitionScreenChickedEvent,
  BrieflyScreenChickedEvent
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  NavigationBloc() : super(const ExhibitionScreen()) {
    on<NavigationEvents>(
      (event, emit) {
        switch (event) {
          case NavigationEvents.ExhibitionScreenChickedEvent:
            emit(const ExhibitionScreen());
            break;
          case NavigationEvents.PopularScreenChickedEvent:
            emit(PopularScreen());
            break;

          case NavigationEvents.BrieflyScreenChickedEvent:
            BrieflyScreen();
            break;
        }
      },
    );
  }
}
