import 'package:flutter/material.dart';

class FormButtonWidget extends StatelessWidget {
  const FormButtonWidget(
      {Key? key, required this.text, this.onPressed})
      : super(key: key);

  final Widget text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
            onPressed: onPressed,
            child: text);
  }
}
