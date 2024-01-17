import 'package:aaaaaaa/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:modul_project/main.dart';
import 'todo_model.dart';
import 'package:provider/provider.dart';

import 'item_list_provider.dart';
import 'item_view.dart';

class Todolist extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Todolist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: goToNewItemView,
      ),
      body: Consumer<StateProvider>(builder: (context, stateProvider, child) {
        return stateProvider.items.isNotEmpty
            ? ListView.builder(
                itemCount: stateProvider.items.length,
                itemBuilder: (context, index) {
                  return TodoItem(
                    item: stateProvider.items[index],
                    onLongPress: goToEditItemView,
                    onDismissed: stateProvider.removeItem,
                  );
                },
              )
            : Center(
                child: Text('Tidak ada Komentar'),
              );
      }),
      bottomSheet: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => NavgasiBawahBar()));
          },
          child: Text('Kembali')),
    );
  }

  // Navigation

  void goToNewItemView() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return ItemView(item: Todo('Komentar'));
    }));
  }

  void goToEditItemView(Todo item) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return ItemView(item: item);
    }));
  }
}

class TodoItem extends StatelessWidget {
  final Todo item;
  final Function(Todo) onLongPress;
  final Function(Todo) onDismissed;

  TodoItem(
      {required this.item,
      required this.onDismissed,
      required this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(item.hashCode.toString()),
      direction: DismissDirection.startToEnd,
      background: Container(
        padding: EdgeInsets.only(left: 12),
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        alignment: Alignment.centerLeft,
      ),
      onDismissed: (direction) => onDismissed(item),
      child: ListTile(
        title: Text(
          item.description,
          style: TextStyle(
              decoration: item.complete ? TextDecoration.lineThrough : null),
        ),
        onLongPress: () => onLongPress(item),
      ),
    );
  }
}
