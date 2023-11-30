import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:kideukkideuk_project/root.dart';
import 'package:kideukkideuk_project/src/binding/init_bindings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.brown,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              titleTextStyle: TextStyle(color: Colors.black),
            )
            //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            //useMaterial3: true,
            ),
        //home: const MyHomePage(title: 'Flutter Demo Home Page'),

        initialBinding: InitBinding(),
        home: const Root() // 버튼 네비게이션 관리, 인덱스에 맞게 변환 (ctrl + .)
        );
  }
}
