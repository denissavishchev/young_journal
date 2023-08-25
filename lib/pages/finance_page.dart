import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:young_journal/constants.dart';
import '../models/finance_provider_model.dart';
import '../widgets/basic_button_widget.dart';
import '../widgets/basic_container_widget.dart';

class FinancePage extends StatelessWidget {
  const FinancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: orange.withOpacity(0.3),
      body: Consumer<FinanceProvider>(
        builder: (context, data, _){
          return Column(
            children: [
              SizedBox(height: size.height * 0.05),
              BasicContainerWidget(
                height: 0.2,
                color: green,
                child: Center(child: Text(data.totalFinances(), style: TextStyle(fontSize: 42),)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BasicButtonWidget(onTap: () =>
                    data.updateFinance(context, true),
                    text: '+',),
                  BasicButtonWidget(onTap: () =>
                    data.updateFinance(context, false),
                    text: '-',),
                ],
              ),
              SizedBox(height: size.height * 0.02,),
              Expanded(
                child: ListView.builder(
                    itemCount: data.finances.length,
                    controller: data.scrollController,
                    reverse: true,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(bottom: 100),
                    itemBuilder: (context, index) {
                      return BasicContainerWidget(
                        height: 0.1,
                        color: data.finances[index][1] < 0 ? orange : green,
                        child: ListTile(
                          title: Text(data.finances[index][0]),
                          subtitle: Text(data.finances[index][1].toString()),
                          trailing: data.finances[index][2].toString() != ''
                            ? Icon(Icons.message_rounded)
                            : SizedBox.shrink(),
                        ),
                      );
                    }),
              ),
            ],
          );
        },
      )
    );
  }
}



