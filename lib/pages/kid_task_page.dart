import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:young_journal/constants.dart';
import 'package:young_journal/functions.dart';
import 'package:young_journal/widgets/fade_container_widget.dart';
import 'package:young_journal/widgets/side_button_widget.dart';
import '../main.dart';
import '../models/kid_provider_model.dart';
import '../widgets/basic_container_widget.dart';
import 'add_task_page.dart';

class KidTaskPage extends StatelessWidget {
  const KidTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Consumer<KidProvider>(
        builder: (context, data, _){
          return Column(
            children: [
              SizedBox(height: size.height * 0.07),
              FadeContainerWidget(
                  child: Row(
                    children: [
                      const Spacer(),
                      Text(convertTime(data.initialDate.millisecondsSinceEpoch),
                        style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                      const Spacer(),
                      SideButtonWidget(
                        right: false,
                        onTap: (){
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const AddTaskPage()));
                        },
                        child: Icon(Icons.add,
                        color: kOrange.withOpacity(0.7),
                        size: 40,),)
                    ],
                  )),
              SizedBox(height: size.height * 0.02,),
              Expanded(
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  width: size.width * 0.9,
                  // height: size.height * 0.7,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(24)),
                    gradient: LinearGradient(
                      colors: [
                        kOrange.withOpacity(0.1),
                        Colors.transparent
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.1, 0.8]
                    )
                  ),
                  child: ScrollConfiguration(
                    behavior: const ScrollBehavior().copyWith(overscroll: false),
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection(email)
                          .orderBy('time', descending: false)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        return ListView.builder(
                            padding: EdgeInsets.only(bottom: size.height * 0.12),
                            itemCount: snapshot.data?.docs.length,
                            controller: data.scrollController,
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
                                              Text((snapshot.data?.docs[index].get('title')).toString(),
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(color: Colors.white,fontSize: 20),),
                                              Text(convertTime(snapshot.data!.docs[index].get('time',)),
                                                style: TextStyle(color:
                                                convertTime(snapshot.data!.docs[index].get('time',))
                                                    == convertTime(data.initialDate.millisecondsSinceEpoch)
                                                ? kOrange
                                                : Colors.white,
                                                    fontSize: 18),),
                                            ],
                                          ),
                                        ),
                                      ),
                                      VerticalDivider(thickness: 2, color: kOrange.withOpacity(0.3),),
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: SizedBox(
                                          width: 180,
                                          height: 60,
                                          child: SingleChildScrollView(
                                            child: Text(snapshot.data!.docs[index].get('comment',),
                                              style: const TextStyle(color: Colors.white, fontSize: 16),),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                        );
                      },
                    )
                  ),
                ),
              ),
            ],
          );
        },
      )
    );
  }
}



