import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../api/firebase_auth_api.dart';

class UserAuthProvider with ChangeNotifier {
  late FirebaseAuthAPI authService;
  late Stream<User?> uStream;
  Stream<User?> get userStream => uStream;

  User? get user => authService.getUser();

  UserAuthProvider() {
    authService = FirebaseAuthAPI();
    fetchAuthentication();
  }

  void fetchAuthentication() {
    uStream = authService.fetchUser();

    notifyListeners();
  }

  Future<void> signUp(String email, String password) async {
    await authService.signUp(email, password);
    notifyListeners();
  }

  Future<void> signIn(String email, String password) async {
    await authService.signIn(email, password);
    notifyListeners();
  }

  Future<void> signOut() async {
    await authService.signOut();
    notifyListeners();
  }
}
