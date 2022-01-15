import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nicolau/screens/briefly/briefly_screen.dart';
import 'package:nicolau/screens/movie_screen/movies_screen.dart';

enum NavigationEvents {
  HomePageChickedEvent,
  AcccountPageChickedEvent,
  OrderPageChickedEvent
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  NavigationBloc() : super(const HomeScreen()) {
    on<NavigationEvents>(
      (event, emit) {
        switch (event) {
          case NavigationEvents.HomePageChickedEvent:
            emit(const HomeScreen());
            break;
          case NavigationEvents.AcccountPageChickedEvent:
            emit(const BrieflyScreen());
            break;

          case NavigationEvents.OrderPageChickedEvent:
            const BrieflyScreen();
            break;
        }
      },
    );
  }
}
