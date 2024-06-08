import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  final Widget child;
  final bool short;

  const ContainerWidget({super.key, required this.child, this.short = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: short == false
          ? const EdgeInsets.symmetric(vertical: 16, horizontal: 24)
          : const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
      child: child,
    );
  }
}
