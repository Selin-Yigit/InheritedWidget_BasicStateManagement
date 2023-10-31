import 'package:flutter/material.dart';
import 'package:statefulapp_course/ApiClass.dart';
import 'package:uuid/uuid.dart';

//Bu class hompage'de materialApp widget'ını sararak widget tree'ye dahil edilecek.
//Bu sayede homepage'in neslinden olan bütün widget'lara erişim sağlanabilecek.
class ApiProvider extends InheritedWidget {
  final API api;
  final String uuid;

  ApiProvider({
    Key? key,
    required this.api,
    required Widget child,
  })  : uuid = const Uuid().v4(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant ApiProvider oldWidget) {
    //bu fonksiyon yeni widgettaki değişikliğin children'ların yeniden çizilmesini gerektrip gerektirmediğini kontrol ettiğimiz yer.
    // bunuda uuid ile sağladık.
    return uuid != oldWidget.uuid;
  }

  static ApiProvider of(BuildContext context){
    //Bu fonksiyon , homepage ve hompage'in neslinden olan tüm child'ların api provider'ın bir kopyasına sahip olmasını sağladık.
    return context.dependOnInheritedWidgetOfExactType<ApiProvider>()!;
  }
}
