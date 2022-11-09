library posa_bottom_bar;

import 'package:flutter/material.dart';
import 'package:animator/animator.dart';

class PosaBottomBar extends StatefulWidget {
  final Widget? child;
  final Function(dynamic i) onChanged;
  final List<IconData> icons;
  final Function(dynamic i)? onLongPress;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? dotColor;
  final Color? shadowColor;
  final double? elevation;
  final double? borderRadius;
  final double? iconSize;
  final double? dotSize;
  final double? margin;
  final double? height;
  final AlignmentGeometry? alignment;
  final bool? isAnimatedIcon;
  final bool? isElevationAnimation;
  final Duration? elevationAnimationDuration;
  final double? elevationAnimationOpacity;

  const PosaBottomBar({
    Key? key,
    required this.child,
    required this.onChanged,
    required this.icons,
    this.onLongPress,
    this.backgroundColor,
    this.iconColor,
    this.dotColor,
    this.shadowColor = Colors.black,
    this.elevation,
    this.borderRadius = 35,
    this.iconSize = 24.0,
    this.dotSize = 5.0,
    this.margin = .05,
    this.height = .160,
    this.alignment = Alignment.bottomCenter,
    this.isAnimatedIcon = false,
    this.isElevationAnimation = false,
    this.elevationAnimationDuration = const Duration(milliseconds: 1500),
    this.elevationAnimationOpacity = 0.3,
  }) : super(key: key);

  @override
  State<PosaBottomBar> createState() => _PosaBottomBarState();
}

class _PosaBottomBarState extends State<PosaBottomBar>
    with TickerProviderStateMixin {
  int currentIndex = 0;

  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    if (widget.icons.length > 6) {
      widget.icons.removeRange(6, widget.icons.length);
    }
    if (widget.isElevationAnimation!) {
      _animationController = AnimationController(
        vsync: this,
        duration: widget.elevationAnimationDuration!,
      );
      _animationController.repeat(reverse: true);
      _animation = Tween(begin: 1.0, end: 13.0).animate(_animationController)
        ..addListener(
          () {
            setState(() {});
          },
        );
    }
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animation.isDismissed;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      alignment: widget.alignment!,
      children: [
        widget.child!,
        normalBar(displayWidth),
      ],
    ));
  }

  Widget normalBar(displayWidth) {
    return Container(
      margin: EdgeInsets.all(displayWidth * widget.margin!),
      child: Material(
        elevation: widget.elevation ?? 0,
        shadowColor: widget.shadowColor,
        borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius!)),
        child: Container(
          height: displayWidth * widget.height!,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: widget.backgroundColor ?? const Color(0xff8a2be1),
              borderRadius:
                  BorderRadius.all(Radius.circular(widget.borderRadius!)),
              boxShadow: widget.isElevationAnimation!
                  ? [
                      BoxShadow(
                        color: widget.shadowColor!
                            .withOpacity(widget.elevationAnimationOpacity!),
                        blurRadius: _animation.value + _animation.value,
                        spreadRadius: _animation.value,
                        offset: Offset(_animation.value, _animation.value),
                      ),
                    ]
                  : []),
          child: Row(
            children: [
              const SizedBox(width: 4),
              ...List.generate(widget.icons.length, (i) {
                return Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() {
                      currentIndex = i;
                      widget.onChanged(i);
                    }),
                    onLongPress: () => setState(() {
                      currentIndex = i;
                      widget.onLongPress!(i);
                    }),
                    child: Container(
                      color: Colors.transparent,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 2),
                      height: displayWidth * .155,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          widget.isAnimatedIcon!
                              ? currentIndex == i
                                  ? Animator<double>(
                                      duration:
                                          const Duration(milliseconds: 2000),
                                      cycles: 0,
                                      curve: Curves.easeInOut,
                                      tween:
                                          Tween<double>(begin: 0.0, end: 5.0),
                                      builder:
                                          (context, animatorState, child) =>
                                              Column(
                                        children: [
                                          SizedBox(
                                            height: animatorState.value * 2.5,
                                          ),
                                          Container(
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.transparent),
                                            child: Icon(
                                              widget.icons[i],
                                              color: widget.iconColor ??
                                                  Colors.white,
                                              size: widget.iconSize,
                                            ),
                                          ),
                                          const SizedBox(height: 6),
                                          currentIndex == i
                                              ? Container(
                                                  width: widget.dotSize,
                                                  height: widget.dotSize,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: widget.dotColor ??
                                                        Colors.white,
                                                  ),
                                                )
                                              : Container(),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                        ],
                                      ),
                                    )
                                  : Icon(
                                      widget.icons[i],
                                      color: widget.iconColor ?? Colors.white,
                                      size: widget.iconSize,
                                    )
                              : Column(
                                  children: [
                                    Icon(
                                      widget.icons[i],
                                      color: widget.iconColor ?? Colors.white,
                                      size: widget.iconSize,
                                    ),
                                    currentIndex == i
                                        ? Container(
                                            width: widget.dotSize,
                                            height: widget.dotSize,
                                            margin:
                                                const EdgeInsets.only(top: 6),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: widget.dotColor ??
                                                  Colors.white,
                                            ),
                                          )
                                        : Container(),
                                  ],
                                ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
              const SizedBox(width: 4),
            ],
          ),
        ),
      ),
    );
  }
}
