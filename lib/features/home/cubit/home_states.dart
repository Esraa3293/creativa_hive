sealed class HomeStates {}

class HomeInitState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeSuccessState extends HomeStates {}

class HomeDataLoadedState extends HomeStates {
  final String name;

  HomeDataLoadedState({required this.name});
}

class HomeErrorState extends HomeStates {
  final String message;

  HomeErrorState({required this.message});
}
