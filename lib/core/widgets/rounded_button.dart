import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:smart_will_client/core/util/size_utils.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? backgroundColor;
  final double? borderRadius;
  final onTap;
  final padding;
  final fontSize;

  RoundedButton(
      {required this.text,
      this.backgroundColor,
      this.textColor,
      this.borderRadius = 40,
      this.onTap,
      this.padding = const EdgeInsets.all(10),
      this.fontSize = 14.0});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      borderRadius: BorderRadius.circular(borderRadius!),
      child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius!),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(fontSize: fontSize),
              )
            ],
          )),
    );
  }
}
