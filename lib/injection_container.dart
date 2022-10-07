import 'package:chat_app/features/chat_app/data/datasources/remote_data_sources/http_data_source.dart';
import 'package:chat_app/features/chat_app/data/repositories/fetch_data_repository_impl.dart';
import 'package:chat_app/features/chat_app/data/repositories/messages_repository_impl.dart';
import 'package:chat_app/features/chat_app/domain/repositories/fetch_data.dart';
import 'package:chat_app/features/chat_app/domain/repositories/messages_repository.dart';
import 'package:chat_app/features/chat_app/domain/usecases/messages_usecase/fetch_message_usecase.dart';
import 'package:chat_app/features/chat_app/domain/usecases/persons_usecases/fetch_persons_usecase.dart';
import 'package:chat_app/features/chat_app/domain/usecases/messages_usecase/post_message_usecase.dart';
import 'package:get_it/get_it.dart';

import 'features/chat_app/presentation/bloc/message_bloc/messages_bloc.dart';
import 'features/chat_app/presentation/bloc/person_bloc/person_bloc.dart';

final sl = GetIt.instance;

void init() {
  sl.registerFactory<PersonBloc>(() => PersonBloc(fetchPersonsUsecase: sl()));
  sl.registerFactory<MessagesBloc>(
      () => MessagesBloc(postMessageUsecase: sl(), fetchMessageUsecase: sl()));

  sl.registerLazySingleton<FetchPersonsUsecase>(
      () => FetchPersonsUsecase(fetchDataRepositiry: sl()));

  sl.registerLazySingleton<FetchMessageUsecase>(
      () => FetchMessageUsecase(messagesRepository: sl()));
  sl.registerLazySingleton<PostMessageUsecase>(
      () => PostMessageUsecase(messagesRepository: sl()));
  sl.registerLazySingleton<FetchDataRepository>(
      () => FetchDataRepositoryImpl(httpDataSource: sl()));

  sl.registerLazySingleton<MessagesRepository>(
      () => MessagesRepositoryImpl(httpDataSource: sl()));

  sl.registerFactory<HttpDataSource>(() => HttpDataSourceImpl());
}
