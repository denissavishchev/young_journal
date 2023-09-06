import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:young_journal/constants.dart';
import 'package:young_journal/models/login_provider_model.dart';
import 'package:young_journal/pages/home_page.dart';

class FinanceProvider with ChangeNotifier {

  List finances = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amongController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  ScrollController scrollController = ScrollController();

  String totalFinances() {
    double total = 0.0;
    for (int i = 0; i < finances.length; i++) {
      total += finances[i];
    }
    print('sum ${finances}');
    print('sum1 ${total}');
    return total.toStringAsFixed(2);
  }

  Future addToBase(String from, double among, String comment) async {
    var email = prefs.getString('email');
    print('email123 $email');
    await FirebaseFirestore.instance
        .collection(prefs.getString('email')!)
        .doc((DateTime.now().millisecondsSinceEpoch).toString())
        .set({'from': from, 'among': among, 'comment': comment});
  }

  Future updateFinance(context, bool action) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 250),
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: const BoxDecoration(
                color: kGrey,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'From',
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _amongController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Among',
                        ),
                      ),
                    ),
                  ],
                ),
                TextField(
                  controller: _commentController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Comment',
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      addToBase(
                          _nameController.text.trim(),
                          !action
                              ? (double.parse(_amongController.text)) * -1
                              : double.parse(_amongController.text),
                          _commentController.text.trim());
                      notifyListeners();
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()));
                      scrollController.animateTo(
                          scrollController.position.maxScrollExtent + 110,
                          duration: const Duration(milliseconds: 10),
                          curve: Curves.linear);
                    },
                    child: const Text('Add'))
              ],
            ),
          );
        });
  }
}
