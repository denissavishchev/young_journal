import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:young_journal/pages/home_page.dart';
import 'package:young_journal/widgets/fade_container_widget.dart';
import '../constants.dart';
import '../models/kid_provider_model.dart';
import '../widgets/side_button_widget.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(body: Consumer<KidProvider>(
      builder: (context, data, _) {
        return ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: SingleChildScrollView(
            child: Container(
              height: size.height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/bg08.png'),
                      fit: BoxFit.cover)),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 0.1,
                  sigmaY: 0.1,
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: size.height * 0.07),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SideButtonWidget(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const HomePage()));
                            },
                            child: Icon(Icons.arrow_back,
                            color: kOrange.withOpacity(0.7),
                            size: 40,),),
                          const Spacer(),
                        ],
                      ),
                      SizedBox(height: size.height * 0.07,),
                      FadeContainerWidget(
                          child: Row(
                            children: [
                              const Spacer(),
                              Text(
                                data.format.format(data.dateTime ?? data.initialDate),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    const BorderRadius.all(Radius.circular(30)),
                                    gradient: LinearGradient(
                                        colors: [
                                          const Color(0xffbebebc).withOpacity(0.5),
                                          const Color(0xff1a1a18).withOpacity(0.8),
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        stops: const [0, 0.75]),
                                  ),
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () => data.datePicker(context),
                                      child: Container(
                                        width: 48,
                                        height: 48,
                                        decoration: BoxDecoration(
                                            color: const Color(0xff91918f),
                                            border:
                                            Border.all(color: kOrange, width: 0.5),
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(25)),
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.black,
                                                  // spreadRadius: 2,
                                                  blurRadius: 3,
                                                  offset: Offset(0, 2)),
                                              BoxShadow(
                                                  color: Color(0xff5e5e5c),
                                                  // spreadRadius: 2,
                                                  blurRadius: 1,
                                                  offset: Offset(0, -1)),
                                            ]),
                                        child: Icon(
                                          Icons.calendar_month,
                                          color: kOrange.withOpacity(0.7),
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  )),
                              const SizedBox(
                                width: 30,
                              ),
                            ],
                          ),),
                      SizedBox(height: size.height * 0.07,),
                      FadeContainerWidget(
                        child: TextField(
                          controller: data.titleController,
                          cursorColor: Colors.white,
                          style: const TextStyle(fontSize: 24, color: Colors.white),
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent)
                            ),
                            hintText: 'Task',
                            hintStyle: TextStyle(fontSize: 24, color: Colors.white.withOpacity(0.7))
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.07,),
                      FadeContainerWidget(
                        height: 0.2,
                        child: TextField(
                          controller: data.descriptionController,
                          cursorColor: Colors.white,
                          maxLines: 4,
                          style: const TextStyle(fontSize: 24, color: Colors.white),
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent)
                              ),
                              hintText: 'Description',
                              hintStyle: TextStyle(fontSize: 24, color: Colors.white.withOpacity(0.7))
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.07,),
                      Row(
                        children: [
                          SideButtonWidget(
                            width: 250,
                              onTap: (){
                                data.addToBase(
                                  data.dateTime!.millisecondsSinceEpoch,
                                  data.titleController.text.trim(),
                                  data.descriptionController.text.trim());
                                Navigator.of(context).pop();
                                // data.scrollController.animateTo(
                                //     data.scrollController.position.maxScrollExtent + 110,
                                //     duration: const Duration(milliseconds: 10),
                                //     curve: Curves.linear);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const HomePage()));
                              },
                              child: Icon(Icons.upload, color: kOrange.withOpacity(0.8), size: 40,)),
                          const Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    ));
  }
}


