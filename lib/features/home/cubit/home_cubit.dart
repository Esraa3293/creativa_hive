import 'package:creativa_storage/core/data_source/hive_data_source.dart';
import 'package:creativa_storage/features/home/cubit/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());
  HiveDataSource dataSource = HiveDataSource();

  Future<void> createName(String name) async {
    emit(HomeLoadingState());
    try {
      await dataSource.createName(name);
      emit(HomeSuccessState());
    } catch (e) {
      emit(HomeErrorState(message: e.toString()));
    }
  }

  Future<void> deleteName() async {
    emit(HomeLoadingState());
    try {
      await dataSource.deleteName();
      emit(HomeSuccessState());
    } catch (e) {
      emit(HomeErrorState(message: e.toString()));
    }
  }

  void getName() {
    emit(HomeLoadingState());
    try {
      String name = dataSource.getName();
      emit(HomeDataLoadedState(name: name));
    } catch (e) {
      emit(HomeErrorState(message: e.toString()));
    }
  }
}
