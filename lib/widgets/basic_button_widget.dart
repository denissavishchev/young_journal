import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:young_journal/constants.dart';
import 'package:young_journal/widgets/glass_morph_widget.dart';

class BasicButtonWidget extends StatelessWidget {
  const BasicButtonWidget({
    super.key,
    required this.onTap,
    required this.text,
    this.width = 60,
    this.height = 60,
  });

  final Function() onTap;
  final String text;
  final double width;
  final double height;


  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, data, _){
          return GestureDetector(
            onTap: onTap,
            child: Container(
              width: width,
              height: height,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
              child: GlassMorphWidget(
                opacityL: 0.13,
                opacityR: 0.05,
                color: kOrange,
                child: Text(text, style: TextStyle(fontSize: 42, color: Colors.white.withOpacity(0.7)),),)
            ),
          );
        });
  }
}