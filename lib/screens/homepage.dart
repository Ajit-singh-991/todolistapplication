import 'package:flutter/material.dart';

import '../widgets/add_new_task.dart';
import '../widgets/list.dart';

//Homepage of the app. It allows the user to insert new tasks to his list.
//It'll allow the user to add new lists too (later features).

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text('TO DO LIST',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
               
                showDialog(
        context: context,
        builder: (_) => const AddNewTask(isEditMode: false,id:"",),
    );
              },
            ),
          ],
        ),
        body: const ListPage(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
                showDialog(
        context: context,
        builder: (_) => const AddNewTask(isEditMode: false,id:"",),
    );
          },
          tooltip: 'Add a new item!',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
