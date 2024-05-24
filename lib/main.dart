import 'package:dictionary/app/base/adapters/database/firebase/firebase_adapter.dart';
import 'package:dictionary/app/modules/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app/base/adapters/shared_adapter/shared_preferences/shared_preferences_adapter.dart';
import 'app/base/shared/application_binding.dart';
import 'app/modules/login/login_binding.dart';
import 'app/routes/app_pages.dart';
import 'app/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ApplicationBinding().dependencies();

  await SharedPreferencesAdapter().init();
  await FirebaseAdapter().initializeApp();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then(
    (value) => runApp(
      const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData.fromView(View.of(context)),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.SPLASH,
        initialBinding: LoginBinding(),
        home: const LoginPage(),
        theme: appThemeData,
        defaultTransition: Transition.leftToRight,
        getPages: AppPages.routes,
        locale: const Locale('pt', 'BR'),
      ),
    );
  }
}
