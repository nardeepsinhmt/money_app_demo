import 'package:flutter/material.dart';

double getPercentageWidth(BuildContext context, double percentage) {
  return ((MediaQuery.of(context).size.width * percentage) / 100);
}

double getPercentageHeight(BuildContext context, double percentage) {
  return ((MediaQuery.of(context).size.height * percentage) / 100);
}