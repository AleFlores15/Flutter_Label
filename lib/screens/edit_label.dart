import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:label_cubit/bloc/label_cubit.dart';
import 'package:label_cubit/screens/form_edit.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LabelsCubit(),
      child: EditLabel(selectedLabel: null,),
    );
  }
}



class EditLabel extends StatelessWidget {
  final selectedLabel;
  EditLabel({super.key, required this.selectedLabel});
  

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
              FormEdit(text: 'Editar', label: selectedLabel ),
              ElevatedButton(onPressed: (){}, child: Text('Cancelar')),
            ],
          ),
        ),
        ),
      )
     );
  }
}