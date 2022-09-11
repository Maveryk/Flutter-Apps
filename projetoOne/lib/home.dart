import 'package:flutter/material.dart';

import 'models/taks.dart';

class Home extends StatelessWidget {
  final list = [
    Task(title: 'title 1', description: 'Descrição 1'),
    Task(title: 'title 2', description: 'Descrição 2'),
    Task(title: 'title 3', description: 'Descrição 3'),
    Task(title: 'title 4', description: 'Descrição 4'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de tarefas'),
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return Center(child: Text(list[index].title));
          },
          separatorBuilder: (BuildContext context, int separetorIndex) {
            return Divider();
          },
          itemCount: list.length),
    );
  }
}
