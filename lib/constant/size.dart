import 'package:flutter/material.dart';

Widget getHorizontalSpace(double spaceH) {
  return SizedBox(
    width: spaceH.toDouble(),
  );
}

Widget getVerticalSpace(double spaceV) {
  return SizedBox(
    height: spaceV.toDouble(),
  );
}

//? dp = default size [16]
double ds() {
  return 16.0;
}
