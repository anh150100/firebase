import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthController extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage!;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final storage = const FlutterSecureStorage();
  Future signUp(String email, String password) async {
    // setLoading(true);
    try {
      UserCredential authResult = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = authResult.user;
      setLoading(false);
      return user;
    } on SocketException {
      setLoading(false);
      setMesage("No internet, please connect to internet");
    } catch (e) {
      setLoading(false);
      setMesage("");
    }
    notifyListeners();
  }

  Future login(String email, String password) async {
    //setLoading(true);
    try {
      UserCredential authResult = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = authResult.user!;
      setLoading(false);
      return user;
    } on SocketException {
      setLoading(false);
      setMesage("No internet, please connect to internet");
    } catch (e) {
      setLoading(false);
      setMesage("The email address is already in use by another account");
    }
    notifyListeners();
  }

  Future logout() async {
    await firebaseAuth.signOut();
  }

  void setLoading(val) {
    _isLoading = val;
    notifyListeners();
  }

  void setMesage(message) {
    _errorMessage = message;
    notifyListeners();
  }

  void storeTokenAndData(UserCredential userCredential) async {
    print("storing token and data");
    await storage.write(
        key: "token", value: userCredential.credential!.token.toString());
    await storage.write(
        key: "usercredential", value: userCredential.toString());
  }

  Future<String?> getToken() async {
    return await storage.read(key: "token");
  }
}
