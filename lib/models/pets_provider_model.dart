import 'package:flutter/material.dart';
import '../constants.dart';

class PetsProvider with ChangeNotifier {

  List pets = [];
  List tasks = [];
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _planNameController = TextEditingController();
  final TextEditingController _planTimeController = TextEditingController();
  final TextEditingController _planCommentController = TextEditingController();
  ScrollController petsScrollController = ScrollController();
  ScrollController petsTasksScrollController = ScrollController();

  Future addPet(context) {
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
                        controller: _typeController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Type',
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Name',
                        ),
                      ),
                    ),
                  ],
                ),
                TextField(
                  controller: _birthdayController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Birthday',
                  ),
                ),
                ElevatedButton(
                    onPressed: (){
                      pets.add([
                        _typeController.text,
                        _nameController.text,
                        _birthdayController.text
                      ]);
                      Navigator.of(context).pop();
                      notifyListeners();
                      petsScrollController.animateTo(
                          petsScrollController.position.maxScrollExtent + 110,
                          duration: const Duration(milliseconds: 10),
                          curve: Curves.linear);
                    },
                    child: Text('Add'))
              ],
            ),
          );
        });
  }

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
                        controller: _planNameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Name',
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _planTimeController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Deadline',
                        ),
                      ),
                    ),
                  ],
                ),
                TextField(
                  controller: _planCommentController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Comment',
                  ),
                ),
                ElevatedButton(
                    onPressed: (){
                      tasks.add([
                        _planNameController.text,
                        _planTimeController.text,
                        _planCommentController.text
                      ]);
                      Navigator.of(context).pop();
                      notifyListeners();
                      petsTasksScrollController.animateTo(
                          petsTasksScrollController.position.maxScrollExtent + 110,
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