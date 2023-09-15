import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:young_journal/constants.dart';
import 'package:young_journal/models/login_provider_model.dart';
import '../models/finance_provider_model.dart';
import '../widgets/basic_button_widget.dart';
import '../widgets/basic_container_widget.dart';

class FinancePage extends StatelessWidget {
  const FinancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kOrange.withOpacity(0.1),
      body: Consumer<FinanceProvider>(
        builder: (context, data, _){
          return Column(
            children: [
              SizedBox(height: size.height * 0.07),
              Container(
                margin: EdgeInsets.only(left: size.width * 0.05),
                height: size.height * 0.08,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(24)),
                    gradient: LinearGradient(
                        colors: [
                          kOrange.withOpacity(0.3),
                          Colors.transparent
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        stops: const [0.1, 0.8]
                    )
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 40,),
                    IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.arrow_back_ios, color: Colors.white,)),
                    const SizedBox(width: 10,),
                    const Text('Monday 23.03', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                    const SizedBox(width: 10,),
                    IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.arrow_forward_ios, color: Colors.white,)),
                    const Spacer(),
                    Container(
                      width: 80,
                      height: 65,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 3,
                                offset: const Offset(0, 2)
                            ),
                          ]
                      ),
                      child: Center(
                        child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(30)),
                              gradient: LinearGradient(
                                  colors: [
                                    const Color(0xffbebebc).withOpacity(0.5),
                                    const Color(0xff1a1a18).withOpacity(0.8),
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  stops: const [0, 0.75]
                              ),
                            ),
                            child: Center(
                              child: GestureDetector(
                                onTap: () => data.addTask(context),
                                child: Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                      color: const Color(0xff91918f),
                                      border: Border.all(
                                          color: kOrange,
                                          width: 0.5),
                                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black,
                                            // spreadRadius: 2,
                                            blurRadius: 3,
                                            offset: Offset(0, 2)
                                        ),
                                        BoxShadow(
                                            color: Color(0xff5e5e5c),
                                            // spreadRadius: 2,
                                            blurRadius: 1,
                                            offset: Offset(0, -1)
                                        ),
                                      ]
                                  ),
                                  child: Icon(Icons.add,
                                    color: kOrange.withOpacity(0.7),
                                    size: 40,),
                                ),
                              ),
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
                          .collection(email!)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        return ListView.builder(
                            padding: EdgeInsets.only(bottom: size.height * 0.12),
                            itemCount: snapshot.data?.docs.length,
                            controller: data.scrollController,
                            reverse: true,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return BasicContainerWidget(
                                height: 0.1,
                                child: ListTile(
                                  title: Text(snapshot.data?.docs[index].get('from'), style: const TextStyle(color: Colors.white),),
                                  subtitle: Text((snapshot.data?.docs[index].get('amount')).toString(), style: const TextStyle(color: Colors.white),),
                                  trailing: (snapshot.data?.docs[index].get('comment')).toString() != ''
                                      ? const Icon(Icons.message_rounded)
                                      : const SizedBox.shrink(),
                                ),
                              );
                            });
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



