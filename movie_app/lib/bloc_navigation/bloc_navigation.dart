
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nicolau/screens/movie_screen/movies_screen.dart';

enum NavigationEvents {
  HomePageChickedEvent,
  AcccountPageChickedEvent,
  OrderPageChickedEvent
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  NavigationBloc(NavigationStates initialState) : super(initialState);


  @override
  NavigationStates get initialState => HomeScreen();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageChickedEvent:
        yield const HomeScreen();
        break;
      case NavigationEvents.AcccountPageChickedEvent:
        // yield AccountPage();
        break;
      case NavigationEvents.OrderPageChickedEvent:
        // yield OrderPage();
        break;
    }
  }
}
