import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:musicland_app/state/auth/models/auth_result.dart';
import 'package:musicland_app/typedef/user_id.dart';

class Authenticator {
  const Authenticator();

  bool get isAlreadyLoggedIn => userId != null;

  UserId? get userId => FirebaseAuth.instance.currentUser?.uid;
  
  String? get currentUserEmail => FirebaseAuth.instance.currentUser?.email;
  
  String? get currentUserDisplayName => FirebaseAuth.instance.currentUser?.displayName;

  Future<void> logOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }

  Future<AuthResult> loginWithEmailAndPassword(
      String email,
      String password,
      ) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return AuthResult.success;
    } catch (e) {
      return AuthResult.failure;
    }
  }

  Future<AuthResult> registerWithEmailAndPassword(
      String email,
      String password,
      ) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return AuthResult.success;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return AuthResult.userAlreadyExists;
      }
      return AuthResult.failure;
    } catch (e) {
      return AuthResult.failure;
    }
  }

  Future<AuthResult> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // If user cancels the sign-in
      if (googleUser == null) {
        return AuthResult.aborted;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential
      await FirebaseAuth.instance.signInWithCredential(credential);
      return AuthResult.success;
    } catch (e) {
      return AuthResult.failure;
    }
  }
}
