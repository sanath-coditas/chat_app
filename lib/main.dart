import 'package:chat_app/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'features/chat_app/presentation/bloc/message_bloc/messages_bloc.dart';
import 'features/chat_app/presentation/bloc/person_bloc/person_bloc.dart';
import 'injection_container.dart' as di;
import 'features/chat_app/presentation/screens/homescreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetIt.instance<PersonBloc>()..add(FetchEvent()),
        ),
        BlocProvider(
          create: (context) => GetIt.instance<MessagesBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: kcustomColor, useMaterial3: true),
        home: const HomeScreen(),
      ),
    );
  }
}
