import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_list/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SplashServices().toDOSplash(BuildContext, context);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Lottie.asset('animation/ani.json',repeat: true,height: 300)),
         const Text('DO What! You Want\nTO DO',
            textAlign: TextAlign.center,
            style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.green,
            fontSize: 40,
          ),)
        ],
      )
    );
  }
}
