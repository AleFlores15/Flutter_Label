import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:label_cubit/bloc/label_cubit.dart';

import '../main.dart';

class FormAdd extends StatelessWidget {
    final TextEditingController _controller = TextEditingController();
  final String text;

   FormAdd({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        TextField(
          controller: _controller,
          decoration: const InputDecoration(
            labelText: 'Etiqueta',
            border: OutlineInputBorder(),
          ),
        ),
        ButtonTheme(
          height: 1000.0,
          child: ElevatedButton(
             onPressed: () => {print(_controller.text), BlocProvider.of<LabelsCubit>(context).addLabel(_controller.text), Navigator.push(context, MaterialPageRoute(builder: (context) => inicio()))},
      
            child: Text(
              text,
            ),
          ),
        ),
        
      ],
    );
  }
}
