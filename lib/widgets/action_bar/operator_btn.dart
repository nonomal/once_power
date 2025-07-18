import 'package:flutter/material.dart';

class OperatorBtn extends StatelessWidget {
  const OperatorBtn(
    this.operator, {
    super.key,
    this.start = true,
    required this.onTap,
  });

  final String operator;
  final bool start;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final radius = start
        ? const BorderRadius.only(
            topLeft: Radius.circular(8.0),
            bottomLeft: Radius.circular(8.0),
          )
        : const BorderRadius.only(
            topRight: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0),
          );

    return Material(
      borderRadius: radius,
      child: Ink(
        decoration: BoxDecoration(borderRadius: radius),
        child: InkWell(
          borderRadius: radius,
          onTap: onTap,
          child: Container(
            width: 20,
            decoration: BoxDecoration(borderRadius: radius),
            alignment: Alignment.center,
            child: Text(
              operator,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
