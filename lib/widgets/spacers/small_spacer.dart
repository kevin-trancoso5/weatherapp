import 'package:flutter/material.dart';
import 'package:weatherapp/services/size_config.dart';

Widget smallSpacer(BuildContext context) {
  return SizedBox(height: safeHeightBloc(context)*2);
}
