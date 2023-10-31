import 'package:flutter/material.dart';
import 'package:statefulapp_course/ApiProvider.dart';
import 'package:statefulapp_course/DateTimeWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //DateTimeWidget'ın yeniden çizilip çizilmeyeceğini kontrol etmek için kullanacağız. null yazma sebebi
  //uygulama ilk çalıştırıldığında elimizde herhangi bir değerin bulnmaması.
  ValueKey _textKey = const ValueKey<String?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          //ApiProvider'da dateandtime bilgisi varsa onu yazdır yoksa boş string yazdır.
          //ApiProvider'a ulaşabildik çünkü HomePage zaten ApiProvider'ın child'ı. (Main sayfasına bak.)
          ApiProvider.of(context).api.dateAndtime ?? '',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.tealAccent.shade700,
      ),
      body: GestureDetector(
        onTap: () async {
          final api = ApiProvider.of(context).api;
          final dateAndTime = await api.getDateAndTime();
          setState(() {
            //Flutter, element tree'deki homepage'e bağlı stateful widget için ilgili elementi rebuilt olması iin işaretler.
            //bu sayede, _textKey'e bağlı her şeyin rebuilt edilmesi gerektiğini belirtir.
            _textKey = ValueKey(dateAndTime);
          });
        },
        child: SizedBox.expand(
          child: Container(
            color: Colors.white,
            child: DateTimeWidget(
              key: _textKey,
            ),
          ),
        ),
      ),
    );
  }
}
