import 'package:flutter/material.dart';
import 'package:mubaha/ui/screen/sign_up%20copy/sign_up_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Ku voucher',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SignUpFinalScreen());
  }
}
