import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/model/auth/login_request.dart';
import 'package:untitled6/model/auth/registration_request.dart';
import 'package:untitled6/provider/auth/auth_provider.dart';
import 'package:untitled6/view/auth/login.dart';
import 'package:untitled6/view/home/home_screen.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _emailController = TextEditingController(text: "eve.holt@reqres.in");
  final _passwordController = TextEditingController(text: "pistol");

  ///loging
  Future<void> registration() async {
    final provider = context.read<AuthProvider>();
    provider.setLoading(loading: true);
    final result = await provider.registration(RegistrationRequest(
        email: _emailController.text, password: _passwordController.text));

    if (result.token != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Registration Successfull"),
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => Login(),
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
                  registration();
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
                        "Registration",
                        style: TextStyle(color: Colors.white),
                      ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const Login(),
                    ),
                  );
                },
                child: const Text("Already You Have Account Login"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
