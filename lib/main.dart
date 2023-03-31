
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:label_cubit/bloc/label_cubit.dart';
import 'package:label_cubit/screens/add_label.dart';
import 'package:label_cubit/screens/edit_label.dart';

import 'bloc/label_state.dart';

void main() {
  runApp(MyWidget());
}
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mi App",
      home: BlocProvider(
        create:(context) => LabelsCubit(), child: const inicio()
      ),
    );
  }
}


class inicio extends StatefulWidget {
  const inicio({super.key});

  @override
  State<inicio> createState() => _inicioState();
}

class _inicioState extends State<inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Etiquetas')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<LabelsCubit, LabelState>(
              builder: (context, state) {
                return Column(
                  children: [
                    DropdownButton <String>(
                      value: state.selected,
                      onChanged: (String? newValue) {
                        context.read<LabelsCubit>().updateSelected(newValue??'a');
                      },
                      items: state.labels.map((label) {
                        return DropdownMenuItem(
                          value: label,
                          child: Text(label),
                        );
                      }).toList(),
                    ),

                    ElevatedButton.icon(
                        onPressed: (){
                            Navigator.push(
                                context, 
                                MaterialPageRoute(
                                    builder: (context) => EditLabel(selectedLabel: state.selected),
                                ),
                            );
                        }, 
                        icon: const Icon(Icons.edit), 
                        label: const Text('Editar')
                    ),

                  ],
                );
              },
            ),
            ElevatedButton.icon(
              onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => AddLabel()));}, 
              icon: const Icon(Icons.add), 
              label: const Text('Añadir')
            ),

            ElevatedButton.icon(
              onPressed: (){
                context.read<LabelsCubit>().deleteSelected(context.read<LabelsCubit>().state.selected);
              }, 
              icon: const Icon(Icons.delete), 
              label: const Text('Eliminar')
            )
          ],
        ),
      ),
    );
  }
}