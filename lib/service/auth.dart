import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:miskapp/module/user.dart';
import 'package:miskapp/service/database.dart';

class AuthService {
  String name;
  String sity;
  String email;
  int phone;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  // sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } on PlatformException catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      FirebaseUser user = result.user;
      return user;
    } on PlatformException catch (error) {
      print(error.toString());
    }
  }

  // register with email and password

  Future registerWithEmailAndPassword(
      String email,
      String password,
      String city,
      String name,
      int phone,
      bool isCustomer,
      bool isMarket,
      bool isDriver,
      bool isAdmin,
      bool isActive) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      // create a new document for the user with the uid
      await DatabaseService(uid: user.uid).updateUserData(user.uid, city, name,
          email, phone, isCustomer, isMarket, isDriver, isAdmin, isActive);
      return _userFromFirebaseUser(user);
    } on PlatformException catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
