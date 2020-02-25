import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  //change in auth stage
  Stream<String> get onAuthStateChanged =>
      _firebaseAuth.onAuthStateChanged.map(
            (FirebaseUser user) => user?.uid,
      );
  //getting uid
  Future <String> getCurrentUid() async {
    return (await _firebaseAuth.currentUser()).uid;
  }

  //email and password sign up
  Future<String> createUserWithEmailAndPass(String email, String password, String name) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return authResult.uid;

  }

  // Email & Password Sign In
  Future<String> signInWithEmailAndPassword(String email,
      String password) async {
    return (await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password)).uid;
  }

  //sign out
  signOut() {
    return _firebaseAuth.signOut();
  }

  // Reset Password
  Future sendPasswordResetEmail(String email) async {
    return _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  // Create Anonymous User
  Future singInAnonymously() {
    return _firebaseAuth.signInAnonymously();
  }
  //Convert anonymous user with email

  //Convert anonymous user with google

  // GOOGLE
  //Future<String> signInWithGoogle() async {
   // final GoogleSignInAccount account = await _googleSignIn.signIn();
   // final GoogleSignInAuthentication _googleAuth = await account.authentication;
   // final AuthCredential credential = GoogleAuthProvider.getCredential(
     //   idToken: _googleAuth.idToken,
    //    accessToken: _googleAuth.accessToken);
    //return (await _firebaseAuth.signInWithCredential(credential)).uid;
  //}
}