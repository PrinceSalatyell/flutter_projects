import 'package:flutter/material.dart';

class ResultModel {
  String headMessage;
  String customMessage;
  Color color;
  String image;

  ResultModel(
      {required this.image,
      required this.headMessage,
      required this.customMessage,
      required this.color});
}
