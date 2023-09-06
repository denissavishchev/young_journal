import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:young_journal/models/login_provider_model.dart';
import '../models/finance_provider_model.dart';
import '../widgets/basic_button_widget.dart';
import '../widgets/basic_container_widget.dart';

class FinancePage extends StatelessWidget {
  const FinancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final initData = Provider.of<FinanceProvider>(context, listen: false);
    initData.totalFinances();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Consumer<FinanceProvider>(
        builder: (context, data, _){
          return Column(
            children: [
              SizedBox(height: size.height * 0.05),
              Center(
                child: SizedBox(
                  width: size.width * 0.9,
                  child: Row(
                    children: [
                      BasicContainerWidget(
                        height: 0.2,
                        width: 0.65,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                BasicContainerWidget(
                                    height: 0.1,
                                    width: 0.2,
                                    child: Container(),
                                ),
                                Text(data.totalFinances(),
                                  style: TextStyle(fontSize: 42, color: Colors.white.withOpacity(0.7)),),
                              ],
                            ),
                            Text('Daniel Savishchev',
                                style: TextStyle(fontSize: 30, color: Colors.white.withOpacity(0.8))),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BasicButtonWidget(
                            onTap: () =>
                              data.updateFinance(context, true),
                            text: '+',),
                          const SizedBox(height: 35,),
                          BasicButtonWidget(onTap: () =>
                              data.updateFinance(context, false),
                            text: '-',),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02,),
              Container(
                clipBehavior: Clip.hardEdge,
                width: size.width * 0.9,
                height: size.height * 0.55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xffb4e7d0).withOpacity(0.6),
                      Colors.transparent
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: const [0.1, 0.8]
                  )
                ),
                child: ScrollConfiguration(
                  behavior: const ScrollBehavior().copyWith(overscroll: false),
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection(prefs.getString('email')!)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return ListView.builder(
                          itemCount: snapshot.data?.docs.length,
                          controller: data.scrollController,
                          reverse: true,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            data.finances.clear();
                            snapshot.data?.docs.forEach((element) {
                              data.finances.add(element['among']);
                            });

                            return BasicContainerWidget(
                              height: 0.1,
                              child: ListTile(
                                title: Text(snapshot.data?.docs[index].get('from'), style: const TextStyle(color: Colors.white),),
                                subtitle: Text((snapshot.data?.docs[index].get('among')).toString(), style: const TextStyle(color: Colors.white),),
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
            ],
          );
        },
      )
    );
  }
}



