import 'package:flutter/material.dart';
import 'package:young_journal/constants.dart';

import '../widgets/basic_container_widget.dart';

class FinancePage extends StatelessWidget {
  const FinancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: orange.withOpacity(0.3),
      body: Column(
        children: [
          SizedBox(height: size.height * 0.05),
          const BasicContainerWidget(
            height: 0.2,
            color: green,
            child: Center(child: Text('128.32', style: TextStyle(fontSize: 42),)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                    color: orange,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    boxShadow: [
                      BoxShadow(
                        color: blue,
                        blurRadius: 3,
                        spreadRadius: 1,
                        offset: Offset(1, 1),
                      )
                    ]),
                child: Center(child: Text('+', style: TextStyle(fontSize: 42),)),
              ),
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                    color: orange,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    boxShadow: [
                      BoxShadow(
                        color: blue,
                        blurRadius: 3,
                        spreadRadius: 1,
                        offset: Offset(1, 1),
                      )
                    ]),
                child: Center(child: Text('-', style: TextStyle(fontSize: 42),)),
              ),

            ],
          ),
          SizedBox(height: size.height * 0.02,),
          Expanded(
            child: ListView.builder(
              itemCount: 100,
                padding: const EdgeInsets.only(bottom: 100),
                itemBuilder: (context, index) {
                  return const BasicContainerWidget(
                    height: 0.1,
                    color: green,
                    child: ListTile(
                      title: Text('income'),
                      subtitle: Text('120'),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

