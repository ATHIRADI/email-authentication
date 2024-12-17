import 'package:flutter/material.dart';
import 'package:version2/utils/utils.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  Future<void> _finishOnboarding(BuildContext context) async {
    await SharedPreferencesHelper.saveBool('hasSeenOnboarding', true);
    Navigator.pushReplacementNamed(context, RouteNames.login);
  }

  List<PageViewModel> _getPages() {
    return [
      _buildPage(
        title: "Welcome",
        body: "Your secure app for managing your account effortlessly.",
      ),
      _buildPage(
        title: "Stay Organized",
        body: "Keep track of your account and preferences in one place.",
      ),
      _buildPage(
        title: "Secure Authentication",
        body: "Experience two-factor authentication and secure login.",
      ),
    ];
  }

  PageViewModel _buildPage({
    required String title,
    required String body,
  }) {
    return PageViewModel(
      decoration: const PageDecoration(
        bodyPadding: AppSizes.paddingScreen,
      ),
      title: title,
      body: body,
      image: Image.asset('assets/images/app_logo.png', height: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      controlsPadding: AppSizes.paddingScreen,
      pages: _getPages(),
      done: const Text("Done"),
      onDone: () => _finishOnboarding(context),
      next: const Icon(Icons.arrow_forward),
      showSkipButton: true,
      skip: const Text("Skip"),
    );
  }
}
