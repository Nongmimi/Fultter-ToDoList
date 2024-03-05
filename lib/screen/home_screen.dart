import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_screen/component/my_button.dart';
import 'package:onboarding_screen/component/my_textfield.dart';
import 'package:onboarding_screen/screen/sign_up_screen.dart';
import 'package:onboarding_screen/screen/todolist_screen.dart';
import '../component/my_iconbtn.dart';

import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Text Editing Controller
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  signInWithEmail() async {
    try {
      //ถ้าerrorยังทำงานต่อได้
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      _showMyDialog('Login successfully.');
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);

      if (e.code == 'invalid-email') {
        _showMyDialog('No user found for that email.');
      } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        _showMyDialog('Wrong password provided for that user.');
      }
    }
  }

  void _showMyDialog(String txtMsg) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: AlertDialog(
            backgroundColor: Colors.amberAccent,
            title: const Text('AlertDialog Title'),
            content: Text(txtMsg),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => const ToDoListScreen())
                      );
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20), //กำหนดซ้ายขวาบนล่าง
        child: Form(
          child: Column(
            children: [
              const Spacer(),
              Text(
                "หวัดดีฮ้าฟฟู่ ,พร้อมไปสนุกกันรึยังค้าฟ?",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ), //อยากใช้fontไรก้ได้ จะใช้ได้ก้ต่อเมื่อinstallในpubspac.yamlก่อน
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "ก่อนเข้าสู่โลกของโบ้ กรุณากรอก username กับ password ก่อนน้า",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.displaySmall,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                ), //อยากใช้fontไรก้ได้ จะใช้ได้ก้ต่อเมื่อinstallในpubspac.yamlก่อน
              ),
              const SizedBox(
                height: 30,
              ),
              MyTextField(
                controller: emailController,
                hintText: "กรอกemailช่องนี้ค้าบ",
                obscureText: false, //ถ้าเป้นtrueจะมองไม่เห้น falseจะมองเห้น
                labelText: "Email",
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                controller: passwordController,
                hintText: "กรอกpasswordช่องนี้ค้าบ",
                obscureText: true, //ถ้าเป้นtrueจะมองไม่เห้น falseจะมองเห้น
                labelText: "Password",
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'ฮั่นแน่ ลืมรหัสผ่านปะจ๊ะ?',
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.displaySmall,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ), //กดละยังไม่ต้องไปไหนตรงonpress
              const SizedBox(
                height: 25,
              ),
              MyButton(
                onTap: signInWithEmail,
                hinText: 'กดปุ่มเพื่อเข้าสู่โลกของโบ้',
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Color.fromARGB(255, 151, 36, 172),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'หรือจะเข้าสู่โลกของโบ้โดย',
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.displaySmall,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Color.fromARGB(255, 151, 36, 172),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyIconButton(imagPath: 'assets/images/google.png'),
                  SizedBox(
                    width: 1,
                  ),
                  MyIconButton(imagPath: 'assets/images/apple.png'),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, //เรียงตรงกลาง
                children: [
                  Text(
                    "ไม่ได้เป็นสมาชิกเหรอ?",
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.displayMedium,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                    ), //อยากใช้fontไรก้ได้ จะใช้ได้ก้ต่อเมื่อinstallในpubspac.yamlก่อน
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ));
                    },
                    child: Text(
                      "สมัครสมาชิกสิ",
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.displayMedium,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        color: Colors.blue,
                      ), //อยากใช้fontไรก้ได้ จะใช้ได้ก้ต่อเมื่อinstallในpubspac.yamlก่อน
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}