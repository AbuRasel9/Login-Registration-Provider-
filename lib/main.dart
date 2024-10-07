import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/provider/auth/auth_provider.dart';
import 'package:untitled6/provider/meme_list_provider.dart';
import 'package:untitled6/utils/service/di_service.dart';
import 'package:untitled6/view/auth/login.dart';
import 'package:untitled6/view/splash_screen.dart';

import 'view/home/home_screen.dart';

void main(){
  diSetup();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<MemeListProvider>(create: (context)=>MemeListProviderImpl()),
      ChangeNotifierProvider<AuthProvider>(create: (context)=>AuthProviderImpl()),


    ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),

    );
  }
}
