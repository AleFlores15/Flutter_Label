import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:label_cubit/bloc/label_cubit.dart';
import 'package:label_cubit/bloc/label_state.dart';
import 'package:label_cubit/screens/form_add.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LabelsCubit(),
      child: AddLabel(),
    );
  }
}



class AddLabel extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  AddLabel({super.key});
  

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => LabelsCubit(), child:
      MaterialApp(
      title: "Mi App",
      home: Scaffold(
        appBar: AppBar(title: Text('Etiquetas')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FormAdd(text: 'Añadir'),
            ],
          ),
        ),
        ),
      )
     );
  }
}