import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task_management_app/core/errors/exceptions.dart';
import 'package:task_management_app/core/utils/constant/sentence/sentence.dart';
class FirebaseAuthServices{
  Future<User?> createUserWithEmailAndPassword({required String emailAddress,required String password})async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(errorMessage: "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(errorMessage: 'The account already exists for that email.');
      }else if(e.code == 'network-request-failed'){
        throw CustomException(errorMessage: Sentence.somethingWentWrongPleaseTryAgain);
      }
    } catch (e) {
     throw CustomException(errorMessage: e.toString());
    }
    return null;
  }
  Future<User?> signInUserWithEmailAndPassword({required String emailAddress,required String password})async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomException(errorMessage: Sentence.noUserFoundForThatEmail);
      } else if (e.code == 'wrong-password') {
        throw CustomException(errorMessage: "Wrong password provided for that user.");
      }else if (e.code == 'invalid-credential') {
        throw CustomException(
            errorMessage: 'Incorrect Password or email.');
      }else if(e.code == 'network-request-failed'){
        throw CustomException(errorMessage: Sentence.somethingWentWrongPleaseTryAgain);
      }
    }catch (e) {
      throw CustomException(errorMessage: e.toString());
    }
    return null;
  }

  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if(googleUser == null ){
      return null;
    }
    final GoogleSignInAuthentication googleAuth =
    await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }
  Future<void> verifyEmail()async{
    await FirebaseAuth.instance.currentUser?.sendEmailVerification();
  }
  Future<User>loginWithEmail({required String emailAddress, required String password})async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomException(errorMessage: Sentence.noUserFoundForThatEmail);
      } else if (e.code == 'wrong-password') {
        throw CustomException(errorMessage: 'Wrong password provided for that user.');
      } else if(e.code == "invalid-credential") {
        throw CustomException(errorMessage: "email or password is wrong , please enter email and password are correct ");
      } else{
        throw CustomException(errorMessage:Sentence.somethingWentWrongPleaseTryAgain);
      }
    }
  }
  Future<void> forgetPassword(String email)async{
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          throw CustomException(errorMessage: Sentence.noUserFoundForThatEmail);
        case 'invalid-email':
          throw CustomException(errorMessage: "email is wrong, please enter email is correct");
        default:
          throw CustomException(errorMessage: Sentence.somethingWentWrongPleaseTryAgain);
      }
    }
  }
}