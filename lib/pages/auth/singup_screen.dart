import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:version2/providers/states.dart';
import 'package:version2/utils/utils.dart';
import 'package:version2/widgets/widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _signUp() async {
    AppHelpers.hideKeyboard(context);
    if (!_formKey.currentState!.validate()) return;

    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    try {
      final isSuccess = await context
          .read<AuthProviders>()
          .signUp(context, email, password, name);

      if (isSuccess) {
        Navigator.pushReplacementNamed(
            context, RouteNames.login); // Navigate to Home Screen
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${error.toString()}')),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: SizedBox(
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const PageHeading(
                        text: "Create \nAn Account",
                      ),
                      const SizedBox(
                        height: AppSizes.sectionSpace,
                      ),
                      CustomTextField(
                        label: 'Name',
                        controller: _nameController,
                        hintText: 'Enter your full name',
                        isPassword: false,
                        validator: (value) => value == null || value.isEmpty
                            ? 'Name is required.'
                            : null,
                      ),
                      CustomTextField(
                        label: 'Email Address',
                        controller: _emailController,
                        hintText: 'Enter your email address',
                        isPassword: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required.';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Enter a valid email.';
                          }
                          return null;
                        },
                      ),
                      CustomTextField(
                        label: 'Password',
                        controller: _passwordController,
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
                        text: 'Sign Up',
                        onPressed: _signUp,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    CustomTextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.login);
                      },
                      textString: 'Login',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
