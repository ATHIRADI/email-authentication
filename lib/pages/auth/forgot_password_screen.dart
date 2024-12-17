import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:version2/utils/routes/route_names.dart';
import 'package:version2/utils/utils.dart';
import 'package:version2/widgets/widgets.dart';

import '../../providers/states.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _sendResetLink() async {
    AppHelpers.hideKeyboard(context);
    if (!_formKey.currentState!.validate()) return;

    final email = _emailController.text.trim();

    try {
      context.read<AuthProviders>().resetPassword(context, email);

      SnackbarHelper.showSuccess(context, 'Password reset email sent!');
      Navigator.pop(context);
    } catch (error) {
      SnackbarHelper.showError(context, 'Error: ${error.toString()}');
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        padding: AppSizes.paddingScreen,
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
                      const PageHeading(text: "Forgot Your \nPassword?"),
                      const SizedBox(
                        height: AppSizes.sectionSpace,
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
                      CustomButton(
                        text: 'Send Reset Link',
                        onPressed: _sendResetLink,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.login);
                      },
                      textString: 'Back to Login',
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
