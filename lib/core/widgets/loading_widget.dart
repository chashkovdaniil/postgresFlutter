import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoadingWidget extends StatefulWidget {
  final double? width;
  final double? height;
  const LoadingWidget({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with SingleTickerProviderStateMixin {
  late final Animation<double> animation;
  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
      lowerBound: 0.3,
      upperBound: 0.8,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) => Opacity(
        opacity: animationController.value,
        child: child,
      ),
      child: Container(
        constraints: BoxConstraints(
          minHeight: widget.height ?? 30,
          minWidth: widget.width ?? 100,
        ),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
