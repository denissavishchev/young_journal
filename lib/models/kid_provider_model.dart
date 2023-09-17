import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:intl/intl.dart';

class KidProvider with ChangeNotifier {

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  ScrollController scrollController = ScrollController();
  DateTime initialDate = DateTime.now();
  DateTime? dateTime = DateTime.now();
  var format = DateFormat('d-MM-yyyy');

  Future addToBase(int time, String title, String comment) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await FirebaseFirestore.instance
        .collection(prefs.getString('email')!)
        .doc((DateTime.now().millisecondsSinceEpoch).toString())
        .set({'time': time, 'title': title, 'comment': comment});
  }

  Future<void> datePicker(context) async {
    dateTime = await showRoundedDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
      borderRadius: 16,
    );
    notifyListeners();
  }

}
