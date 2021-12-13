import 'package:flutter/material.dart';


//Responsive

Size screenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double totalHeight(BuildContext context) {
  return screenSize(context).height;
}

double totalWidth(BuildContext context) {
  return screenSize(context).width;
}

double safeHeight(BuildContext context) {
  return totalHeight(context) - kToolbarHeight - kBottomNavigationBarHeight;
}

double heightBloc(BuildContext context) {
  return totalHeight(context) / 100;
}

double widthBloc(BuildContext context) {
  return totalWidth(context) / 100;
}

double safeHeightBloc(BuildContext context) {
  return safeHeight(context) / 100;
}