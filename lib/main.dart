import 'package:flutter/material.dart';
import 'package:onboarding_screen/screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screen/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:onboarding_screen/firebase_options.dart';

bool show = true; //ประกาศเป้นgobal ทุกตัวแปรดูได้
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, 
  ); //รอให้คำสั่งฟายเบสเชื่อม

  final prefs =
      await SharedPreferences.getInstance(); //เมื่ออยู่ในช่วงruntime จะทำงาน
  show = prefs.getBool('ON_BOARDING') ??
      true; //vriable name ยังไม่ถึงหน้าสุดท้ายให้เป็นtrue
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding Screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: show
          ? IntroScreen()
          : HomeScreen(), //เขียนคำสั่งifในรูปแบบย่อ ถ้าจิงไปintro ถ้าไม่จิงให้ไปHomescreen
    );
  }
}