import 'package:flutter/material.dart';
import 'item_list_provider.dart';
import 'todo_model.dart';
import 'package:provider/provider.dart';

class ItemView extends StatefulWidget {
  final Todo item;

  ItemView({required this.item});

  @override
  _ItemViewState createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    if (widget.item != null)
      _textEditingController.text = widget.item.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Isi Komentar'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _textEditingController,
                onFieldSubmitted: (value) => submit(),
                textCapitalization: TextCapitalization.sentences,
                autofocus: true,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                child: Text('Tambah'),
                onPressed: submit,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                child: Text('Edit'),
                onPressed: edit,
              )
            ],
          ),
        ));
  }

  void submit() {
    String description = _textEditingController.text;
    if (description != null && description.isNotEmpty) {
      context.read<StateProvider>().addNewTask(description);

      Navigator.pop(context, _textEditingController.text);
    }
  }

  void edit() {
    String description = _textEditingController.text;
    if (description != null && description.isNotEmpty) {
      context.read<StateProvider>().editTask(widget.item, description);

      Navigator.pop(context, _textEditingController.text);
    }
  }
}
