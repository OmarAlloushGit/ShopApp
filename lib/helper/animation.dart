// ignore_for_file: file_names, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

// ignore: must_be_immutable
class AnimationScaleWidget extends StatelessWidget {
  int position;
  double horizontalOffset, verticalOffset;
  Widget child;
  int milliseconds;

  AnimationScaleWidget(
      {Key? key, this.position = 0,
        this.horizontalOffset = 0,
        this.verticalOffset = 100,
        required this.child,
        this.milliseconds = 800}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: position,
      duration: Duration(milliseconds: milliseconds),
      child: SlideAnimation(
        horizontalOffset: horizontalOffset,
        verticalOffset: verticalOffset,
        child: FadeInAnimation(
          child: child,
        ),
      ),
    );
  }
}
