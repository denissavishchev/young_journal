import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:young_journal/constants.dart';

class FinanceProvider with ChangeNotifier {

  List finances = [];
  double totalAmount = 0.0;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  ScrollController scrollController = ScrollController();

  String totalFinances() {
    double total = 0.0;
    for (int i = 0; i < finances.length; i++) {
      total += finances[i];
    }
    totalAmount = total;
    print('totalAmount $totalAmount');
    print('sum ${finances}');
    print('sum1 ${total}');
    return total.toStringAsFixed(2);
  }

  Future addToBase(String from, double amount, String comment) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('email');
    print('email123 $email');
    await FirebaseFirestore.instance
        .collection(prefs.getString('email')!)
        .doc((DateTime.now().millisecondsSinceEpoch).toString())
        .set({'from': from, 'amount': amount, 'comment': comment});
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
                        controller: _amountController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'amount',
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
                    onPressed: () async{
                      addToBase(
                          _nameController.text.trim(),
                          !action
                              ? (double.parse(_amountController.text)) * -1
                              : double.parse(_amountController.text),
                          _commentController.text.trim());
                      notifyListeners();
                      Navigator.of(context).pop();
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => HomePage()));
                      scrollController.animateTo(
                          scrollController.position.maxScrollExtent + 110,
                          duration: const Duration(milliseconds: 10),
                          curve: Curves.linear);
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setDouble('amount', totalAmount);
                    },
                    child: const Text('Add'))
              ],
            ),
          );
        });
  }
}
