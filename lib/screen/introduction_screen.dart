import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  final List<PageViewModel> pages = [
    PageViewModel(
        title: 'ไอ่โบ้',
        body: 'ผมโบ้ หล่อแบบสับตับปิ้ง 2 ไม้',
        footer: SizedBox(
          height: 45,
          width: 150,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 8,
            ),
            onPressed: () {},
            child: const Text('อะจึ๋ย'),
          ),
        ),
        image: Image.network('assets/images/โบ้.jpg'),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ))),
    PageViewModel(
        title: 'น้องจ๋อง',
        body: 'ยอมรับว่าน้อยใจ เหมือนผัดไทที่น้อยจัง',
        footer: SizedBox(
          height: 45,
          width: 150,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 8,
            ),
            onPressed: () {},
            child: const Text('กิ้วกิ้ว'),
          ),
        ),
        image: Image.network('assets/images/จ๋อง.jpg'),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ))),
    PageViewModel(
        title: 'พี่แจ๋ง',
        body: 'รูปหล่อ โปรฟายดี อยากมีแม่ศรีเรือน',
        footer: SizedBox(
          height: 45,
          width: 150,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 8,
            ),
            onPressed: () {},
            child: const Text('บรึ๋ย บรึ๋ย'),
          ),
        ),
        image: Image.network('assets/images/แจ๋ง.jpg'),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('โบ้ แอน เดอะ แก๊ง'),
        centerTitle: true,
      ),
      body: IntroductionScreen(
        pages: pages,
        showSkipButton: true,
        skip: const Text('Skip'),
        showDoneButton: true,
        done: const Text('Done'),
        showNextButton: true,
        next: const Icon(
          Icons.arrow_forward,
          size: 25,
        ),
        onDone: () => onDone(context),
        curve: Curves.bounceOut,
        dotsDecorator: const DotsDecorator(
          size: Size(15, 15),
          color: Color.fromARGB(255, 8, 57, 149),
          activeColor: Color.fromARGB(255, 178, 6, 35),
          activeSize: Size.square(20),
        ),
      ),
    );
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }
}