import 'package:flutter/material.dart';

class API {
  String? dateAndtime;
  Future<String> getDateAndTime() {
    //Bu fonksiyonda 1 sn delay oluşturarak tarih ve saati güncelledik. Bunun sonucunda state her saniye güncellenmek zorunda kaldı.
    return Future.delayed(
      const Duration(seconds: 1),
      () => DateTime.now().toIso8601String(),
    ).then(
      (value) {
        dateAndtime = value;
        return value;
      },
    );
  }
}
