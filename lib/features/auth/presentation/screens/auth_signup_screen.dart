import 'package:edtech_app/constants/theme/style.dart';
import 'package:edtech_app/core/util/global_snack_bar.dart';
import 'package:edtech_app/features/auth/presentation/business_logic/user_auth_bloc/user_auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

class AuthSignupScreen extends StatefulWidget {
  const AuthSignupScreen({super.key});

  @override
  State<AuthSignupScreen> createState() => _AuthSignupScreenState();
}

class _AuthSignupScreenState extends State<AuthSignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserAuthBloc, UserAuthState>(
      listener: (context, authState) {
        if (authState is UserAuthSignupSuccess) {
          context.loaderOverlay.hide();
          GlobalSnackBar.show(
            context: context,
            message: 'Registration success!',
            color: Theme.of(context).colorScheme.primary,
          );
          Navigator.pop(context);
        }
        if (authState is UserAuthSignupFailed) {
          context.loaderOverlay.hide();
          GlobalSnackBar.show(
              context: context, message: 'Signup failed! Please try again.');
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
              statusBarColor: Theme.of(context).colorScheme.primary),
          child: Scaffold(
            /*appBar: AppBar(
            title: const AuthTitleView(title: 'Signup'),
            centerTitle: true,
          ),*/
            body: CustomScrollView(
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
                          'Sign Up',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(height: 24.0),
                        Row(
                          children: [
                            Text(
                              'Already have an account?',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Sign In',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 48.0),
                        Form(
                          key: signupFormKey,
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
                            if (signupFormKey.currentState != null &&
                                signupFormKey.currentState!.validate()) {
                              context.read<UserAuthBloc>().add(
                                    UserAuthEventSignUp(
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
                            'REGISTER NOW',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary),
                          ),
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
    );
  }
}
