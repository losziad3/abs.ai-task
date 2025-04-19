import 'package:absai/features/auth/view/view.dart';
import 'package:absai/features/home/view/home_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/cubit/cubit.dart';
import 'features/home/cubit/cubit.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (_) => NotesCubit()..loadNotes(),

    ),
        BlocProvider(create: (context) => LoginCubit()),
      ],
      child:  MaterialApp(

        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}

