import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:young_journal/constants.dart';

import '../models/plans_provider_model.dart';
import '../widgets/basic_button_widget.dart';
import '../widgets/basic_container_widget.dart';

class PlansPage extends StatelessWidget {
  const PlansPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBlue.withOpacity(0.3),
      body: Consumer<PlansProvider>(
        builder: (context, data, _){
          return Column(
            children: [
              SizedBox(height: size.height * 0.05),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    const Spacer(),
                    BasicButtonWidget(
                      onTap: () => data.addTask(context),
                      text: '+',)
                  ],
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: data.tasks.length,
                      controller: data.taskScrollController,
                      reverse: true,
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(bottom: 100),
                      itemBuilder: (context, index) {
                        return BasicContainerWidget(
                          height: 0.1,
                          child: ListTile(
                            title: Text(data.tasks[index][0]),
                            subtitle: Text(data.tasks[index][1]),
                            trailing: data.tasks[index][2].toString() != ''
                                ? Icon(Icons.message_rounded)
                                : SizedBox.shrink(),
                          ),
                        );
                      }),)
            ],
          );
        },
      ),
    );
  }
}
