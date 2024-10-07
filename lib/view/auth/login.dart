import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/model/auth/login_request.dart';
import 'package:untitled6/provider/auth/auth_provider.dart';
import 'package:untitled6/view/auth/registration.dart';
import 'package:untitled6/view/home/home_screen.dart';

import '../../repo/sharePrefs/share_prefs.dart';
import '../../utils/service/di_service.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController(text: "eve.holt@reqres.in");
  final _passwordController = TextEditingController(text: "cityslicka");

  final diSharePrefs=di<SharePrefs>();


  ///loging
  Future<void> login() async {
    final provider = context.read<AuthProvider>();
    provider.setLoading(loading: true);
    final result = await provider.login(LoginRequest(
        email: _emailController.text, password: _passwordController.text));
    if (result.token != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login Successfull"),
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Login Not Successfull")));
    }
    provider.setLoading(loading: false);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter Email"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter Email"),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  login();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: provider.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
              ),
            ),
            const SizedBox(height: 10,),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(onPressed: (){

                Navigator.push(context, MaterialPageRoute(builder: (_)=>const Registration(),),);
              },child: const Text("Don't Have Account SingUp"),),
            )
          ],
        ),
      ),
    );
  }
}
