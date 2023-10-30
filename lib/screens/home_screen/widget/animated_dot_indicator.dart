import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:quickread/constant/size.dart';

class AnimatedDotIndicator extends StatelessWidget {
  const AnimatedDotIndicator({
    super.key,
    required this.activeIndex,
  });

  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: 10,
        effect: ExpandingDotsEffect(
          dotHeight: ds() / 2.2,
          dotWidth: ds() / 2.2,
          activeDotColor: Colors.red,
        ),
      ),
    );
  }
}
