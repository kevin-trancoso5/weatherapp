import 'package:flutter/material.dart';
import 'package:weatherapp/services/size_config.dart';

Widget bigSpacer(BuildContext context) {
  return SizedBox(height: safeHeightBloc(context)*15);
}