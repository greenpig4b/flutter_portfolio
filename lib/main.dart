import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // 화면 파일 가져오기

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interactive Portfolio',
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(), // 분리한 화면을 여기서 호출
      debugShowCheckedModeBanner: false,
    );
  }
}
