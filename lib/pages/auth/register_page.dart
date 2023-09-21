import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:young_journal/models/reg_provider_model.dart';
import 'package:young_journal/widgets/basic_button_widget.dart';
import '../../constants.dart';
import '../../widgets/fade_textfield_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      body: Consumer<RegProvider>(
        builder: (context, data, _){
          return ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(overscroll: false),
            child: SingleChildScrollView(
              child: Container(
                height: size.height,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/bg10.png'), fit: BoxFit.cover
                    )
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 0.1,
                    sigmaY: 0.1,
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: size.height * 0.05),
                        Container(
                          clipBehavior: Clip.hardEdge,
                          width: size.width * 0.9,
                          height: size.height * 0.5,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(Radius.circular(24)),
                              gradient: LinearGradient(
                                  colors: [
                                    const Color(0xff206e84).withOpacity(0.6),
                                    const Color(0xff206e84).withOpacity(0.0),
                                    const Color(0xff206e84).withOpacity(0.6),
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  stops: const [0.2, 0.5, 0.6]
                              )
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FadeTextFieldWidget(
                                textEditingController: data.nameController,
                                hintText: 'Name',),
                              FadeTextFieldWidget(
                                textEditingController: data.surnameController,
                                hintText: 'Surname',),
                              FadeTextFieldWidget(
                                textEditingController: data.eMailController,
                                hintText: 'Email',),
                              FadeTextFieldWidget(
                                textEditingController: data.passwordController,
                                hintText: 'Password',),
                              FadeTextFieldWidget(
                                textEditingController: data.confirmPasswordController,
                                hintText: 'Confirm password',),
                            ],
                          ),
                        ),
                        SizedBox(height: size.height * 0.03,),
                        SizedBox(
                          width: size.width * 0.9,
                          child: AnimatedAlign(
                            alignment: data.elder
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                            duration: const Duration(milliseconds: 150),
                            child: Container(
                              width: 220,
                              height: 65,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        blurRadius: 3,
                                        offset: const Offset(0, 2)
                                    ),
                                  ]
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  data.elder
                                      ? AnimatedOpacity(
                                        duration: const Duration(milliseconds: 400),
                                        opacity: data.elder ? 1 : 0,
                                        child: SizedBox(
                                          width: 120,
                                          height: 60,
                                          child: Center(
                                            child: Text('Elder',style: TextStyle(fontSize: 32, color: Colors.white.withOpacity(0.7))),
                                          ),
                                        ),
                                      )
                                      : Container(),
                                  AnimatedAlign(
                                    alignment: data.elder
                                        ? Alignment.centerRight
                                        : Alignment.centerLeft,
                                    duration: const Duration(milliseconds: 150),
                                    child: GestureDetector(
                                      onTap: (){
                                        data.switchRole();
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 16),
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
                                                        blurRadius: 3,
                                                        offset: Offset(0, 2)
                                                        ),
                                                    BoxShadow(
                                                        color: Color(0xff5e5e5c),
                                                        blurRadius: 1,
                                                        offset: Offset(0, -1)
                                                    ),
                                                  ]
                                              ),
                                              child: Center(
                                                child: AnimatedCrossFade(
                                                  crossFadeState: data.elder
                                                    ? CrossFadeState.showFirst
                                                    : CrossFadeState.showSecond,
                                                  duration: const Duration(milliseconds: 200),
                                                  firstChild: const Icon(Icons.switch_right),
                                                  secondChild: const Icon(Icons.switch_left),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ),
                                    ),
                                  ),
                                  data.elder
                                      ? Container()
                                      : AnimatedOpacity(
                                        duration: const Duration(milliseconds: 400),
                                        opacity: data.elder ? 0 : 1,
                                        child: SizedBox(
                                          width: 120,
                                          height: 60,
                                          child: Center(
                                            child: Text('Kid', style: TextStyle(fontSize: 32, color: Colors.white.withOpacity(0.7))),
                                          ),
                                        ),
                                      ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.03,),
                        SizedBox(
                          height: 60,
                          child: Visibility(
                            visible: data.elder,
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 200),
                              opacity: data.elder ? 1 : 0,
                              child: FadeTextFieldWidget(
                                textEditingController: data.relationController,
                                hintText: 'Relation',),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.03,),
                        BasicButtonWidget(
                            width: size.width * 0.9,
                            onTap: () => data.register(),
                            text: 'Register'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
