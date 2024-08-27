import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/core/navigation_service.dart';
import 'package:untitled/dashboard/dashboard.dart';

import 'routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // final controller = Get.put(ThemeController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        builder: (context, child) {
          final mediaQueryData = MediaQuery.of(context);
          final scale = mediaQueryData.textScaler.clamp(minScaleFactor: 1.0, maxScaleFactor: 1.0);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: scale, boldText: false),
            child: child!,
          );
        },
        title: 'GIG',
        debugShowCheckedModeBanner: false,
        navigatorKey: NavigationService().navigatorKey,
        getPages: AppPages.appPages,
        home: const Dashboard(),
      ),
    );
  }
}
