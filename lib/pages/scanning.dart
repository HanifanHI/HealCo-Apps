import 'package:flutter/material.dart';
import 'package:healco/config/colors.dart';
import 'package:scanning_effect/scanner_animation.dart';
import 'package:scanning_effect/scanner_border_painter.dart';

class CustomScanning extends StatefulWidget {
  const CustomScanning({
    super.key,
    required this.child,
    this.scanningColor = cWhiteColor,
    this.borderLineColor = cWhiteColor,
    this.scanningHeightOffset = 0.8,
    this.delay = const Duration(milliseconds: 700),
    this.duration = const Duration(milliseconds: 2800),
    this.scanningLinePadding =
        const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
  });

  final Widget child;
  final Color scanningColor;
  final Color borderLineColor;
  final double scanningHeightOffset;
  final Duration delay;
  final Duration duration;
  final EdgeInsetsGeometry scanningLinePadding;

  @override
  State<CustomScanning> createState() => _CustomScanningState();
}

class _CustomScanningState extends State<CustomScanning>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animationController
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Future.delayed(
            widget.delay,
            () {
              _animationController
                ..reset()
                ..forward(from: 0);
            },
          );
        }
      })
      ..forward(from: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        widget.child,
        CustomPaint(
          painter: ScannerBorderPainter(
            color: widget.borderLineColor,
          ),
        ),
        Padding(
          padding: widget.scanningLinePadding,
          child: ClipRect(
            child: ScannerAnimation(
              animation: _animationController,
              scanningColor: widget.scanningColor,
              scanningHeightOffset: widget.scanningHeightOffset,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
