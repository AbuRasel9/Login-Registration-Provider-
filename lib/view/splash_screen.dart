import 'package:flutter/material.dart';
import 'package:untitled6/repo/sharePrefs/share_prefs.dart';
import 'package:untitled6/view/auth/login.dart';
import 'package:untitled6/view/home/home_screen.dart';

import '../utils/service/di_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final diSharePrefs=di.get<SharePrefs>();
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value){
      print("-------------------------------${diSharePrefs.token}");
      if(diSharePrefs.token?.isEmpty ??false|| diSharePrefs.token==null ){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Login()));
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));


      }
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Welcome Screen",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
