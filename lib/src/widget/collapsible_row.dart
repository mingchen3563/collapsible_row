import 'dart:developer';

import 'package:collapsible_row/collapsible_row.dart';
import 'package:flutter/material.dart';

class CollapsibleRowTwoColumn extends StatefulWidget {
  const CollapsibleRowTwoColumn({
    Key? key,
    required this.left,
    required this.right,
    required this.controller,
  }) : super(key: key);
  final Widget left;
  final Widget right;
  final CollapsibleController controller;

  @override
  State<CollapsibleRowTwoColumn> createState() =>
      _CollapsibleRowTwoColumnState();
}

class _CollapsibleRowTwoColumnState extends State<CollapsibleRowTwoColumn>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    _animationInitializer();
    _excuteAnimation();

    widget.controller.addListener(() {
      setState(() {
        log('change notified');
        _excuteAnimation();
      });
    });
  }

  @override
  void didUpdateWidget(covariant CollapsibleRowTwoColumn oldWidget) {
    super.didUpdateWidget(oldWidget);
    _excuteAnimation();
  }

  void _animationInitializer() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    animation = animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn,
    );
  }

  void _excuteAnimation() {
    log('excute animaiton');
    log('collaping ${widget.controller.isCollapsed}');

    if (widget.controller.isCollapsed) {
      animationController.reverse();
    } else {
      animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizeTransition(
          axis: Axis.horizontal,
          sizeFactor: animation,
          child: widget.left,
        ),
        Expanded(child: widget.right),
      ],
    );
  }
}
