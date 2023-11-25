import 'dart:io';

import 'package:edtech_app/constants/navigation/routes.dart';
import 'package:edtech_app/constants/theme/style.dart';
import 'package:edtech_app/core/util/global_snack_bar.dart';
import 'package:edtech_app/features/auth/presentation/business_logic/user_auth_bloc/user_auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

class AuthLoginScreen extends StatefulWidget {
  const AuthLoginScreen({super.key});

  @override
  State<AuthLoginScreen> createState() => _AuthLoginScreenState();
}

class _AuthLoginScreenState extends State<AuthLoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserAuthBloc, UserAuthState>(
      listener: (context, authState) {
        if (authState is UserAuthLoginSuccess) {
          context.loaderOverlay.hide();
          Navigator.pushReplacementNamed(context, Routes.kDashboardScreen);
        }
        if (authState is UserAuthLoginFailed) {
          context.loaderOverlay.hide();
          GlobalSnackBar.show(
              context: context, message: 'Login failed! Please try again.');
        }
        if (authState is UserAuthInitial) {
          context.loaderOverlay.show();
        }
        if (authState is UserAuthError) {
          context.loaderOverlay.hide();
          GlobalSnackBar.show(
              context: context, message: 'Something went wrong!');
        }
      },
      child: LoaderOverlay(
        overlayColor: Style.kOverlayColor,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).colorScheme.primary,
            statusBarBrightness: Brightness.light,
          ),
          child: Scaffold(
            /*appBar: AppBar(
            title: const AuthTitleView(title: 'Login'),
            centerTitle: true,
          ),*/
            body: PopScope(
              canPop: false,
              onPopInvoked: (didPop) {
                showDialog<void>(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext dialogContext) {
                    return AlertDialog(
                      title: const Text('Want to exit now?'),
                      content: const Text('dialogBody'),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Cancel'),
                          onPressed: () {
                            Navigator.of(dialogContext).pop();
                          },
                        ),
                        TextButton(
                          child: const Text('Confirm'),
                          onPressed: () {
                            if (Platform.isAndroid) {
                              SystemNavigator.pop();
                            } else if (Platform.isIOS) {
                              exit(0);
                            }
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 120.0),
                          Text(
                            'Login',
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          const SizedBox(height: 24.0),
                          Text(
                            'Hello there, haven’t we seen you before?',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(height: 48.0),
                          Form(
                            key: loginFormKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.emailAddress,
                                  controller: emailController,
                                  onChanged: (value) {
                                    emailController.text = value;
                                  },
                                  validator: (value) => value!.isEmpty
                                      ? 'Enter a valid email address'
                                      : null,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: const InputDecoration(
                                    labelText: 'Enter your email',
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 8,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16.0),
                                TextFormField(
                                  textAlign: TextAlign.center,
                                  controller: passwordController,
                                  obscureText: true,
                                  onChanged: (value) {
                                    passwordController.text = value;
                                  },
                                  validator: (value) => value!.isEmpty
                                      ? 'Enter a valid password'
                                      : null,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: const InputDecoration(
                                    labelText: 'Enter your password',
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 8,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24.0),
                          ElevatedButton(
                            onPressed: () async {
                              if (loginFormKey.currentState != null &&
                                  loginFormKey.currentState!.validate()) {
                                context.read<UserAuthBloc>().add(
                                      UserAuthEventLogin(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      ),
                                    );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                            ),
                            child: Text(
                              'LOGIN NOW',
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.onPrimary),
                            ),
                          ),
                          const SizedBox(height: 24.0),
                          Row(
                            children: [
                              const Text('New here?'),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, Routes.kAuthSignupScreen);
                                },
                                child: const Text('Sign Up'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24.0),
                          OutlinedButton(
                            onPressed: () async {
                              Navigator.pushNamed(
                                  context, Routes.kDashboardScreen);
          
                              /*try {
                              final user = await _auth.signInWithEmailAndPassword(
                                  email: email, password: password);
                              if(user != null){
                                //Navigate to dashboard
                              }
                            }catch(e){}*/
                            },
                            child: const Text('Dashboard'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
