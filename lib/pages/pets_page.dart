import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:young_journal/constants.dart';
import '../models/pets_provider_model.dart';
import '../widgets/basic_button_widget.dart';
import '../widgets/basic_container_widget.dart';

class PetsPage extends StatelessWidget {
  const PetsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPurple.withOpacity(0.3),
      body: Consumer<PetsProvider>(
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
                      onTap: () => data.addPet(context),
                      text: '+',)
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.05),
              SizedBox(
                height: size.height * 0.65,
                child: PageView.builder(
                  itemCount: data.pets.length,
                    itemBuilder: (context, index){
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      color: kBlue,
                      child:
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(data.pets[index][0]),
                              Text(data.pets[index][1]),
                              Text(data.pets[index][2]),
                            ],
                          ),
                          Row(
                            children: [
                              const Spacer(),
                              BasicButtonWidget(
                                onTap: () => data.addTask(context),
                                text: '+',)
                            ],
                          ),
                          Expanded(
                            child: ListView.builder(
                                itemCount: data.tasks.length,
                                controller: data.petsTasksScrollController,
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
                      ),
                    );
                    }),
              )
            ],
          );
        },
      ),
    );
  }
}
