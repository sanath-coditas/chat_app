import 'package:bloc/bloc.dart';
import 'package:chat_app/features/chat_app/domain/entities/person.dart';
import 'package:chat_app/features/chat_app/domain/usecases/persons_usecases/fetch_persons_usecase.dart';
import 'package:equatable/equatable.dart';

part 'person_event.dart';
part 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  final FetchPersonsUsecase fetchPersonsUsecase;
  PersonBloc({required this.fetchPersonsUsecase}) : super(PersonInitial()) {
    on<PersonEvent>((event, emit) {});
    on<FetchEvent>((event, emit) async {
      final getFetchEither = await fetchPersonsUsecase(FetchPersonParams());
      getFetchEither.fold(
        (l) => emit(ErrorState(message: l.toString())),
        (r) => emit(LoadedState(persons: r)),
      );
    });
  }
}
