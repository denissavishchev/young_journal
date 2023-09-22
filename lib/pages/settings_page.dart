import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:young_journal/main.dart';
import 'package:young_journal/models/settings_provider_model.dart';
import 'package:young_journal/widgets/side_button_widget.dart';
import '../constants.dart';
import '../widgets/basic_container_widget.dart';
import '../widgets/fade_textfield_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kGreen.withOpacity(0.1),
      body: Consumer<SettingsProvider>(
        builder: (context, data, child){
          return SizedBox(
            width: size.width,
            height: size.height,
            child: Column(
              children: [
                SizedBox(height: size.height * 0.05),
                FadeTextFieldWidget(
                  textEditingController: data.requestController,
                  hintText: 'Kid`s Email',),
                Align(
                  alignment: Alignment.centerRight,
                  child: SideButtonWidget(
                    right: false,
                      child: Icon(Icons.upload, color: kOrange.withOpacity(0.8), size: 40,),
                      onTap: (){
                      data.checkEmail();
                      }
                      ),
                ),
                SizedBox(
                  width: size.width,
                  height: size.height * 0.2,
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('requests')
                        .snapshots(),
                    builder: (context, snapshot) {
                      print('1 ${FirebaseFirestore.instance
                          .collection('requests').doc(email).toString().substring(49, )}');
                      print('2 $email');

                      if (snapshot.hasData && FirebaseFirestore.instance
                          .collection('requests').doc(email).toString().substring(49, ) == '$email)') {
                        return ListView.builder(
                          padding: EdgeInsets.only(bottom: size.height * 0.12),
                          itemCount: snapshot.data?.docs.length,
                          // controller: data.scrollController,
                          reverse: false,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return BasicContainerWidget(
                              height: 0.1,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: SizedBox(
                                        width: 100,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text((snapshot.data?.docs[index].get('name')).toString(),
                                              style: const TextStyle(color: Colors.red,fontSize: 20),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                      return const Text('No requests');
                    },
                  ),
                )
              ],
            ),
          );
        },
      )
    );
  }
}