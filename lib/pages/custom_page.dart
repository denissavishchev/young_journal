import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../models/finance_provider_model.dart';
import '../widgets/basic_container_widget.dart';
import '../widgets/painters/button_painter.dart';
import '../widgets/painters/main_list_view_painter.dart';

class CustomPage extends StatelessWidget {
  const CustomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<FinanceProvider>(
        builder: (context, data, _){
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 100,
                        right: 0,
                        left: 0,
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.symmetric(horizontal: 18),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.5,
                          color: Colors.transparent,
                          child: CustomPaint(
                            painter: MainListViewPainter(),
                            child: ClipRRect(
                              clipBehavior: Clip.hardEdge,
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
                          ),
                        ),
                      ),
                      Positioned(
                        top: 80,
                        right: 0,
                        child: GestureDetector(
                          onTap: () => data.updateFinance(context, true),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.symmetric(horizontal: 18),
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.height * 0.15,
                            color: Colors.transparent,
                            child: CustomPaint(
                              painter: ButtonPainter(),
                              child: const Center(
                                child: Text('+', style: TextStyle(fontSize: 32),),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 180,
                        right: 0,
                        child: GestureDetector(
                          onTap: () => data.updateFinance(context, false),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.symmetric(horizontal: 18),
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.height * 0.15,
                            color: Colors.transparent,
                            child: CustomPaint(
                              painter: ButtonPainter(),
                              child: const Center(
                                child: Text('-', style: TextStyle(fontSize: 32),),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 130,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(110),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.8),
                                  blurRadius: 20,
                                  offset: const Offset(10, 10),
                                ),
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.2),
                                  blurRadius: 20,
                                  offset: const Offset(-10, -10),
                                ),
                              ]
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ]
          );
        },
      ),
    );
  }
}