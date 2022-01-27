import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nocinema/screens/briefly/briefly_screen.dart';
import 'package:nocinema/screens/movie_screen/exhibition_screen.dart';
import 'package:nocinema/screens/popular/popular_screen.dart';

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
            emit(BrieflyScreen());
            break;
        }
      },
    );
  }
}
