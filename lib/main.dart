import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/provider/auth/auth_provider.dart';
import 'package:untitled6/provider/meme_list_provider.dart';
import 'package:untitled6/view/auth/login.dart';

import 'view/home_screen.dart';

void main(){
  runApp(MyApp());
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
        home: Login(),
      ),

    );
  }
}
