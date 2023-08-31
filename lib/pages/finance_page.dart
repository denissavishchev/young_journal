import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:young_journal/constants.dart';
import '../models/finance_provider_model.dart';
import '../widgets/basic_button_widget.dart';
import '../widgets/basic_container_widget.dart';
import 'package:fl_chart/fl_chart.dart';

class FinancePage extends StatelessWidget {
  const FinancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kOrange.withOpacity(0.3),
      body: Consumer<FinanceProvider>(
        builder: (context, data, _){
          return Column(
            children: [
              SizedBox(height: size.height * 0.05),
              BasicContainerWidget(
                height: 0.2,
                color: kGreen,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BasicContainerWidget(
                        height: 0.1,
                        width: 0.2,
                        color: kGrey,
                        child: Image.asset('assets/images/2.png')
                    ),
                    Column(
                      children: [
                        const Text('Daniel Savishchev', style: TextStyle(fontSize: 30)),
                        Text(data.totalFinances(),
                          style: const TextStyle(fontSize: 42),),
                        BasicContainerWidget(
                            height: 0.06,
                            width: 0.6,
                            color: kGrey,
                            child: LineChart(
                              LineChartData(
                                  titlesData: const FlTitlesData(
                                      show: false
                                  ),
                                  borderData: FlBorderData(
                                      show: false
                                  ),
                                  // minX: 0,
                                  // maxX: 4,
                                  minY: -200,
                                  maxY: 200,
                                  lineBarsData: [
                                    LineChartBarData(
                                      dotData: const FlDotData(
                                          show: false
                                      ),
                                      barWidth: 5,
                                      isCurved: true,
                                      gradient: const LinearGradient(
                                          colors: [
                                            kPurple,
                                            kOrange,
                                          ]
                                      ),
                                      spots: data.spot(data.spots),
                                    ),
                                  ]
                              ),
                            ),
                        )
                      ],
                    )
                  ],
                ),
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
                        color: data.finances[index][1] < 0 ? kOrange : kGreen,
                        child: ListTile(
                          title: Text(data.finances[index][0]),
                          subtitle: Text(data.finances[index][1].toString()),
                          trailing: data.finances[index][2].toString() != ''
                            ? const Icon(Icons.message_rounded)
                            : const SizedBox.shrink(),
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



