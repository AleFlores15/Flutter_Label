import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:label_cubit/bloc/label_cubit.dart';

import '../main.dart';

class FormEdit extends StatelessWidget {
    
    final String text;
    final String label;
    final TextEditingController _controller = TextEditingController();


   FormEdit({
    Key? key,
    required this.text,
    required this.label,
    

  }) : super(key: key){
    _controller.text = label;
  }

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
            onPressed: () => {print(label),
            //editar
             BlocProvider.of<LabelsCubit>(context).updateLabel(label, _controller.text),
             Navigator.push(context, MaterialPageRoute(builder: (context) => inicio()))
            },
            child: Text(
              text,
            ),
          ),
        ),
      ],
    );
  }
}
