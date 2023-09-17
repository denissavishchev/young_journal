import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:young_journal/constants.dart';
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
                      const SizedBox(width: 40,),
                      IconButton(
                          onPressed: (){},
                          icon: const Icon(Icons.arrow_back_ios, color: Colors.white,)),
                      const SizedBox(width: 10,),
                      Text(data.format.format(data.dateTime ?? data.initialDate),
                        style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                      const SizedBox(width: 10,),
                      IconButton(
                          onPressed: (){},
                          icon: const Icon(Icons.arrow_forward_ios, color: Colors.white,)),
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
                          .orderBy('time', descending: true)
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
                                child: ListTile(
                                  title: Text(snapshot.data!.docs[index].get('time').toString(),
                                    style: const TextStyle(color: Colors.white),),
                                  subtitle: Text((snapshot.data?.docs[index].get('title')).toString(), style: const TextStyle(color: Colors.white),),
                                  trailing: (snapshot.data?.docs[index].get('comment')).toString() != ''
                                      ? const Icon(Icons.message_rounded)
                                      : const SizedBox.shrink(),
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



