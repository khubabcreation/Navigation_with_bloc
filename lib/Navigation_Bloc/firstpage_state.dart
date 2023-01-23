part of 'firstpage_bloc.dart';

@immutable
abstract class FirstpageState {}

class FirstpageInitial extends FirstpageState {}

class FirstpageLoadingState extends FirstpageState {}

class FirstpageLoadedState extends FirstpageState {}

class FirstpageErrorState extends FirstpageState {
  String errormsg ;
  FirstpageErrorState({required this.errormsg});

}
