part of 'person_bloc.dart';

abstract class PersonState extends Equatable {
  const PersonState();

  @override
  List<Object> get props => [];
}

class PersonInitial extends PersonState {
  @override
  List<Object> get props => [];
}

class LoadingState extends PersonState {
  @override
  List<Object> get props => [];
}

class LoadedState extends PersonState {
  final List<Person> persons;
  const LoadedState({required this.persons});
  @override
  List<Object> get props => [persons];
}

class ErrorState extends PersonState {
  final String message;
  const ErrorState({required this.message});
  @override
  List<Object> get props => [message];
}
