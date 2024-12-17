import 'package:flutter/material.dart';
import 'package:version2/models/models.dart';
import 'package:version2/services/services.dart';
import 'package:version2/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProviders with ChangeNotifier {
  final AuthService _authService = AuthService();
  UserModel? _user;

  UserModel? get user => _user;

  Future<UserModel?> initializeUser(BuildContext context) async {
    try {
      Logger.logInfo("Initializing user...");
      final currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        _user = await _fetchUserData(currentUser);
        Logger.logInfo("User initialization successful: ${_user!.name}");
        notifyListeners();
        return _user;
      } else {
        Logger.logInfo("No user logged in.");
        return null;
      }
    } catch (e) {
      _handleError(e, context, "Failed to initialize user");
      return null;
    }
  }

  Future<UserModel> _fetchUserData(User user) async {
    final userService = UserService();
    final userData = await userService.getUser(user.uid);
    if (userData != null) {
      return userData;
    }

    return UserModel(
      uid: user.uid,
      email: user.email ?? 'No Email',
      name: user.displayName ?? 'Unknown User',
      profilePicture: user.photoURL ?? '',
    );
  }

  Future<bool> login(
      BuildContext context, String email, String password) async {
    try {
      Logger.logInfo("Attempting to log in...");
      final user = await _authService.login(email, password);
      _setUser(user!);
      SnackbarHelper.showSuccess(context, "Login successful!");
      return true;
    } catch (e) {
      _handleError(e, context, "Login failed");
      return false; // Login failed
    }
  }

  Future<bool> signUp(
      BuildContext context, String email, String password, String name) async {
    try {
      Logger.logInfo("Attempting to sign up...");
      final user = await _authService.signUp(email, password, name);
      _setUser(user!);
      SnackbarHelper.showSuccess(context, "Sign-up successful!");
      return true;
    } catch (e) {
      _handleError(e, context, "Sign-up failed");
      return false;
    }
  }

  Future<void> resetPassword(BuildContext context, String email) async {
    if (email.isEmpty) {
      SnackbarHelper.showError(context, "Email cannot be empty.");
      return;
    }

    try {
      Logger.logInfo("Sending password reset email to $email...");
      await _authService.resetPassword(email);
      SnackbarHelper.showSuccess(context, "Password reset email sent!");
    } catch (e) {
      _handleError(e, context, "Failed to send password reset email");
    }
  }

  Future<void> logout(BuildContext context) async {
    try {
      await _authService.logout();
      _user = null;
      notifyListeners();
      SnackbarHelper.showSuccess(context, "Logged out successfully.");
    } catch (e) {
      _handleError(e, context, "Logout failed");
      rethrow;
    }
  }

  void _setUser(User user) {
    _user = UserModel(
      uid: user.uid,
      email: user.email ?? '',
      name: user.displayName ?? 'User',
      profilePicture: '',
    );
    notifyListeners();
  }

  void _handleError(e, BuildContext context, String fallbackMessage) {
    Logger.logError("Error: ${e.toString()}");
    SnackbarHelper.showError(
      context,
      (e is FirebaseAuthException && e.message != null)
          ? fallbackMessage
          : e.message!,
    );
  }
}
