import 'package:flutter/material.dart';
import 'package:statefulapp_course/ApiProvider.dart';

class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //mevcut bulunan api'ın kopyasını verdik.
    final api = ApiProvider.of(context).api;
    return Text(api.dateAndtime ?? 'Tap on screen to fetch date and time !!');
  }
}