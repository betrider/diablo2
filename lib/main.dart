import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_diablo2_exchange/localization_service.dart';
import 'package:flutter_diablo2_exchange/route.dart';
import 'package:flutter_diablo2_exchange/screens/main/main_screen.dart';
import 'package:flutter_diablo2_exchange/utils/constants/color_constants.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:flutter_diablo2_exchange/index.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //비동기 메소드 사용하기 위해 선언

  if (GetPlatform.isMobile) await Firebase.initializeApp(); //파이어베이스 초기화

  await GetStorage.init();

  await GlobalConfiguration().loadFromAsset("config"); //환경설정 세팅

  //intl 언어 설정(기본값)
  Intl.defaultLocale = 'ko_KR';

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: getLocale(),
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      localizationsDelegates: [
        //다국어 지원
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        //다국어 지원
        const Locale('ko', 'KR'),
        const Locale('en', 'US'),
      ],
      getPages: RouteGenerator.getPages(),
      routingCallback: RouteGenerator.routingCallback,
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
      home: GetBuilder<UserController>(
        init: UserController(
          loginId: storage.read('loginId'),
          phoneNumber: storage.read('phoneNumber'),
          battleTagId: storage.read('battleTagId'),
          diabloId: storage.read('diabloId'),
        ),
        builder: (controller) {
          print('로그인 아이디 : ${controller.loginId}');
          print('휴대폰 번호 : ${controller.phoneNumber}');
          print('배틀태그 아이디 : ${controller.battleTagId}');
          print('디아블로 아이디 : ${controller.diabloId}');
          return MainScreen();
        },
      ),
    );
  }

  Locale getLocale() {
    String storageLocale = storage.read('locale');
    Locale? locale;

    if (storageLocale == 'en_US') {
      Intl.defaultLocale = 'en_US';
      locale = Locale('en', 'US');
    } else if (storageLocale == 'ko_KR2') {
      Intl.defaultLocale = 'ko_KR';
      locale = Locale('ko', 'KR2');
    } else {
      Intl.defaultLocale = 'ko_KR';
      locale = Locale('ko', 'KR');
    }

    return locale;
  }
}
