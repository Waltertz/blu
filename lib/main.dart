import 'package:amis/pages/HomePage.dart';
import 'package:amis/pages/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';




void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(seconds: 3)
    ..loadingStyle = EasyLoadingStyle.light
    ..indicatorSize = 65.0
    ..indicatorWidget = CircularProgressIndicator()
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.white
    ..indicatorColor = Colors.green
    ..lineWidth = 15.0
    ..textColor = Colors.black
    ..maskColor = Colors.white.withOpacity(0.5)
    ..userInteractions = false
    ..customAnimation = CustomAnimation();
}

//========================Class for easy loading animation
class CustomAnimation extends EasyLoadingAnimation {
  CustomAnimation();

  @override
  Widget buildWidget(
      Widget child,
      AnimationController controller,
      AlignmentGeometry alignment,
      ) {
    return Opacity(
      opacity: controller.value,
      child: RotationTransition(
        turns: controller,
        child: child,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      title: 'Academic management information system',
      theme: ThemeData(
        primarySwatch: Palette.PrimaryColor,
      ),
      initialRoute: FirebaseAuth.instance.currentUser == null ? LoginPage.idScreen : HomePage.idScreen,
      routes: {
        LoginPage.idScreen: (context) => LoginPage(),
        HomePage.idScreen: (context) => HomePage(),

      },
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}


class Palette {
  static const MaterialColor PrimaryColor = Colors.green;
}
