import 'package:flutter/material.dart';

import '../constants.dart';

class PlansProvider with ChangeNotifier {
  List tasks = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _deadlineController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  ScrollController scrollController = ScrollController();

  Future addTask(context) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 250),
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: const BoxDecoration(
                color: grey,
                borderRadius: BorderRadius.all(Radius.circular(16))
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Name',
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _deadlineController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Deadline',
                        ),
                      ),
                    ),
                  ],
                ),
                TextField(
                  controller: _commentController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Comment',
                  ),
                ),
                ElevatedButton(
                    onPressed: (){
                      tasks.add([
                        _nameController.text,
                        _deadlineController.text,
                        _commentController.text
                      ]);
                      Navigator.of(context).pop();
                      notifyListeners();
                      scrollController.animateTo(
                          scrollController.position.maxScrollExtent + 110,
                          duration: const Duration(milliseconds: 10),
                          curve: Curves.linear);
                    },
                    child: Text('Add'))
              ],
            ),
          );
        });
  }

}