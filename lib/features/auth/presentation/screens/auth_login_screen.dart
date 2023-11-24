import 'package:edtech_app/features/auth/presentation/screens/views/auth_title_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthLoginScreen extends StatefulWidget {
  const AuthLoginScreen({super.key});

  @override
  State<AuthLoginScreen> createState() => _AuthLoginScreenState();
}

class _AuthLoginScreenState extends State<AuthLoginScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AuthTitleView(title: 'Login'),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100.0,
                  child: Image.asset('assets/images/app_logo.png'),
                ),
                const SizedBox(height: 48.0),
                TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                  ),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  textAlign: TextAlign.center,
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter your password',
                  ),
                ),
                const SizedBox(height: 24.0),
                OutlinedButton(
                  onPressed: () async {
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if(user != null){
                        //Navigate to dashboard
                      }
                    }catch(e){
                      print(e);
                    }
                  },
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

