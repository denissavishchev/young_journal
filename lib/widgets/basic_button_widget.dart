import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:young_journal/widgets/glass_morph_widget.dart';

class BasicButtonWidget extends StatelessWidget {
  const BasicButtonWidget({
    super.key, required this.onTap, required this.text,
  });

  final Function() onTap;
  final String text;


  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, data, _){
          return GestureDetector(
            onTap: onTap,
            child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
              child: GlassMorphWidget(child: Text(text, style: const TextStyle(fontSize: 42),),)
            ),
          );
        });
  }
}