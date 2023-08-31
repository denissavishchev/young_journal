import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:young_journal/constants.dart';

class FinanceProvider with ChangeNotifier {

  List finances = [];
  final List<double> spots = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amongController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  ScrollController scrollController = ScrollController();

  List<FlSpot> spot(List spots) {
    return spots.asMap().entries.map((e) {
      return FlSpot(e.key.toDouble(), e.value);
    }).toList();
  }

  String totalFinances(){
    double total = 0.0;
    for(int i = 0; i < finances.length; i++){
      total += finances[i][1];
    }
    return total.toStringAsFixed(2);
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
                borderRadius: BorderRadius.all(Radius.circular(16))
            ),
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
                    onPressed: (){
                      finances.add([
                        _nameController.text,
                        !action
                            ? (double.parse(_amongController.text)) * -1
                            : double.parse(_amongController.text),
                        _commentController.text
                      ]);
                      spots.add(
                          !action
                          ? (double.parse(_amongController.text)) * -1
                          : double.parse(_amongController.text)
                      );
                      Navigator.of(context).pop();
                      notifyListeners();
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