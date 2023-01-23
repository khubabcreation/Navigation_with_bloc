import 'package:bloc_stack_navigation/Navigation_Bloc/firstpage_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height - kToolbarHeight;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      color: Colors.grey,
      child: Center(
        child:
            ElevatedButton(
                onPressed: () {
                 Provider.of<FirstpageBloc>(context,listen: false).add(gotoNext());
                },
                child: Text('Go to Next Route')),
      ),
    );
  }
}
