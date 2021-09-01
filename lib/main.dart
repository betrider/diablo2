import 'package:flutter/material.dart';
import 'package:flutter_diablo2_exchange/screens/main/main_screen.dart';
import 'package:flutter_diablo2_exchange/utils/constants/color_constants.dart';
import 'package:get/get.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); //비동기 메소드 사용하기 위해 선언

  await Hive.initFlutter(); //Hive 초기화
  await Hive.openBox('cache'); //Hive cache박스 등록

  await GlobalConfiguration().loadFromAsset("config"); //환경설정 세팅
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBgColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(backgroundColor: kPrimaryColor),
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: kBodyTextColor),
          bodyText2: TextStyle(color: kBodyTextColor),
          headline5: TextStyle(color: kDarkBlackColor),
        ),
      ),
      home: MainScreen(),
    );
  }
}
