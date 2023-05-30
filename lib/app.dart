import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:mubaha/ui/screen/sign_up%20copy/sign_up_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Ku voucher',
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SignUpFinalScreen());
  }
}
