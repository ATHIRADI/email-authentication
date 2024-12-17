import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:version2/providers/states.dart';

import 'package:version2/utils/utils.dart';
import 'package:version2/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _logout(BuildContext context, AuthProviders authProvider) async {
    try {
      await authProvider.logout(context);
      Navigator.pushReplacementNamed(context, RouteNames.login);
    } catch (error) {
      Logger.logError('Error logging out: $error');
      SnackbarHelper.showError(context, error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProviders>(context);
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              context.watch<ThemeProvider>().themeMode == ThemeMode.dark
                  ? Icons.dark_mode // Icon for dark mode
                  : Icons.light_mode, // Icon for light mode
            ),
            onPressed: () {
              // Toggle the theme
              context.read<ThemeProvider>().toggleTheme();
            },
          ),
        ],
      ),
      body: authProvider.user == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: AppSizes.paddingScreen,
              child: SafeArea(
                child: SizedBox(
                  height: height,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome, ${authProvider.user!.name}',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      Text(
                        'Email: ${authProvider.user!.email}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        height: AppSizes.sectionSpace,
                      ),
                      CustomButton(
                        onPressed: () => _logout(context, authProvider),
                        text: 'Logout',
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
