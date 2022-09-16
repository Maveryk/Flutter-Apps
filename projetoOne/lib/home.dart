import 'package:flutter/material.dart';

import 'models/taks.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  static final titleController = TextEditingController();
  static final descriptionController = TextEditingController();

  final list = [
    Task(title: 'title 1', description: 'Descrição 1'),
    Task(title: 'title 2', description: 'Descrição 2'),
    Task(title: 'title 3', description: 'Descrição 3'),
    Task(title: 'title 4', description: 'Descrição 4'),
  ];

  void remove(index) {
    setState(() {
      list.removeAt(index);
    });
  }

  save() {
    Task task = Task(
        title: titleController.text, description: descriptionController.text);
    setState(() {
      list.add(task);
    });
    titleController.clear();
    descriptionController.clear();
    Navigator.of(context).pop();
  }

  add() {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
              title: const Text('Adicionar Tarefa'),
              content: SizedBox(
                height: 200,
                child: Column(children: [
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(labelText: 'Título'),
                  ),
                  TextField(
                    controller: descriptionController,
                    decoration: const InputDecoration(labelText: 'Descrição'),
                  )
                ]),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () => save(),
                  child: const Text('Salvar'),
                )
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de tarefas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            color: Colors.white,
            onPressed: () => add(),
          )
        ],
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(list[index].title),
              subtitle: Text(list[index].description),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {
                  remove(index);
                },
              ),
            );
          },
          separatorBuilder: (BuildContext context, int separetorIndex) {
            return const Divider();
          },
          itemCount: list.length),
    );
  }
}
