import 'package:cliffhub/controller/providers/login_provider.dart';
import 'package:cliffhub/controller/providers/otp_provider.dart';
import 'package:cliffhub/controller/providers/signup_provider.dart';
import 'package:cliffhub/view/introduction_screen/intro_screen.dart';
import 'package:cliffhub/view/otp_screen/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Color.fromARGB(255, 2, 2, 2),
    
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignUpProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
         ChangeNotifierProvider(
          create: (context) => OtpProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const IntroScreen(),
      ),
    );
  }
}
