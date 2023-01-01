import 'package:flutter/material.dart';

class SmallTextWidget extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final TextAlign? align;
  final double height;
  final int maxLine;
  final double letterSpacing;
  final TextOverflow textOverflow;
  final FontWeight fontWeight;
  final FontStyle? style;


  const SmallTextWidget(
      {Key? key,
        this.style,
        this.letterSpacing = 1,
        this.fontWeight = FontWeight.w400,
        this.color = Colors.black,
        this.size = 14,
        this.height = 1.0,
        this.align,
        required this.text,
        this.maxLine = 1,
        this.textOverflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      textAlign: align ?? TextAlign.center,
      maxLines: maxLine,
      style: TextStyle(
          color: color,
          height: height,
          letterSpacing: letterSpacing,
          fontWeight: fontWeight,
          fontFamily: 'Objectivity',
          fontStyle: FontStyle.normal,
          fontSize: size),
    );
  }
}
