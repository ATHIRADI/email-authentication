import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:version2/providers/states.dart';
import 'package:version2/utils/utils.dart';
import 'package:version2/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _login() async {
    AppHelpers.hideKeyboard(context);
    if (!_formKey.currentState!.validate()) return;

    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    try {
      final isSuccess =
          await context.read<AuthProviders>().login(context, email, password);

      if (isSuccess) {
        Navigator.pushNamedAndRemoveUntil(
          context, RouteNames.home,
          (route) => false, // This removes all previous routes
        ); // Navigate to Home Screen
      }
    } catch (e) {
      SnackbarHelper.showError(context, "Login failed: ${e.toString()}");
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: height,
            child: Padding(
              padding: AppSizes.paddingScreen,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const PageHeading(
                          text: "Welcome \nBack",
                        ),
                        const SizedBox(
                          height: AppSizes.sectionSpace,
                        ),
                        CustomTextField(
                          label: 'Email Address',
                          controller: emailController,
                          hintText: 'Enter your email address',
                          keyboardType: TextInputType.emailAddress,
                          isPassword: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email is required.';
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Enter a valid email.';
                            }
                            return null;
                          },
                        ),
                        CustomTextField(
                          label: 'Password',
                          controller: passwordController,
                          hintText: 'Enter your password',
                          isPassword: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required.';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: AppSizes.itemSpace,
                        ),
                        CustomButton(
                          text: 'Login',
                          onPressed: _login,
                        ),
                        CustomTextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RouteNames.forgotPassword);
                          },
                          textString: 'Forgot Password?',
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      CustomTextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RouteNames.signUp);
                        },
                        textString: 'Signup',
                      ),
                    ],
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
