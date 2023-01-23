import 'package:bloc_stack_navigation/FirstScreen.dart';
import 'package:bloc_stack_navigation/Navigation_Bloc/SecondScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Navigation_Bloc/firstpage_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FirstpageBloc>(
      create: (context) => FirstpageBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          FirstScreen(),
          BlocBuilder<FirstpageBloc, FirstpageState>(
            builder: (context, state) {
              if (state is FirstpageLoadingState) {
                return CircularProgressIndicator();
              } else if (state is FirstpageLoadedState) {
                SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SecondScreen(),
                  ));
                });
              }
              return SizedBox();
            },
          )
        ],
      ),
    );
  }
}
