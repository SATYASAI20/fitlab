import 'package:firebase_core/firebase_core.dart';
import 'package:fit_lab/firebase_options.dart';
import 'package:fit_lab/src/repository/authentication_repository/authentication_repository.dart';
import 'package:fit_lab/src/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); // this line indicates firebase initialization
  // this line shows the current platform and ****(after firebase initilize ****(then) funtion will AuthRepository will be validated
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(const myApp());
}

// ignore: camel_case_types
class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Fitlab",
      debugShowCheckedModeBanner: false,
      theme: FAppTheme.lightTheme,
      darkTheme: FAppTheme.darkTheme,
      themeMode: ThemeMode.system,

      // defaultTransition: Transition.leftToRightWithFade,
      // transitionDuration: const Duration(milliseconds: 300),
      home: const CircularProgressIndicator.adaptive(),
      // home: const SplashScreen(),
      // home: const SplashScreen(),
      // home: const MyhomePage(title: "Fitlab"),
    );
  }
}

class MyhomePage extends StatelessWidget {
  const MyhomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // color: Color.fromARGB(255, 234, 146, 31)
        title: Text(title),
      ),
    );
  }
}

// Platform  Firebase App Id
// web       1:837771691150:web:d336f154e160d95368f5df
// android   1:837771691150:android:8a89ef5055aa41ff68f5df
// ios       1:837771691150:ios:6ca3c319b10c9bca68f5df
