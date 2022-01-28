import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nocinema/screens/briefly/briefly_screen.dart';
import 'package:nocinema/screens/movie_screen/exhibition_screen.dart';
import 'package:nocinema/screens/popular/popular_screen.dart';

enum NavigationEvents {
  popularScreenChickedEvent,
  exhibitionScreenChickedEvent,
  brieflyScreenChickedEvent
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  NavigationBloc() : super(const ExhibitionScreen()) {
    on<NavigationEvents>(
      (event, emit) {
        switch (event) {
          case NavigationEvents.exhibitionScreenChickedEvent:
            emit(const ExhibitionScreen());
            break;
          case NavigationEvents.popularScreenChickedEvent:
            emit(PopularScreen());
            break;

          case NavigationEvents.brieflyScreenChickedEvent:
            emit(BrieflyScreen());
            break;
        }
      },
    );
  }
}
