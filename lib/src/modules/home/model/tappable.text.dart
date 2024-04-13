import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TappableText extends Text {
  final Function(String) onTap;

  const TappableText({
    super.key,
    required String data,
    TextStyle? style,
    required this.onTap,
  }) : super(data, style: style);
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: style,
        children: data!.split(RegExp(r'\s+')).map((word) {
          return TextSpan(
            text: '$word ',
            style: style?.copyWith(color: Colors.blue),
            recognizer: TapGestureRecognizer()..onTap = () => onTap(word),
          );
        }).toList(),
      ),
    );
  }

  // TextSpan buildTextSpan(BuildContext context, TextStyle? style) {
  //   final words = data!.split('');
  //   return TextSpan(
  //     style: style,
  //     children: words.map((word) {
  //       return TextSpan(
  //         text: '$word ',
  //         style: style?.copyWith(color: Colors.blue),
  //         recognizer: TapGestureRecognizer()
  //           ..onTap = () {
  //             onTap(word);
  //           },
  //       );
  //     }).toList(),
  //   );
  // }
}
