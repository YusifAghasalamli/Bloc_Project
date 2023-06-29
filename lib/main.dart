import 'package:bloc_project/features/home/bloc/home_bloc.dart';
import 'package:bloc_project/features/home/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc()..add(HomeInitialEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.teal),
        // home: BlocProvider<HomeBloc>(
        //   create: (context) => HomeBloc(),
        //   child: Home(),
        // ),
        home: const Home(),
      ),
    );
  }
}
