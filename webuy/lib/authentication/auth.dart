import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationClass {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;

  //sign up method
  Future signupMethod({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //sign in method

  Future signinMethod({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //signout method

  Future signout() async {
    await _auth.signOut();
    print('You Have Signout');
  }
}
