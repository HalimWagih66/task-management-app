import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task_management_app/core/models/user_model.dart';
import 'package:task_management_app/core/utils/constant/sentence/sentence.dart';
import '../../../errors/exceptions/custom_firebase_exception.dart';
import '../../../errors/exceptions/exceptions.dart';
import '../services/auth_services.dart';
class FirebaseAuthServices implements AuthServices{
  @override
  Future<String?> createAccountWithEmailAndPassword({required String emailAddress,required String password})async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return credential.user?.email;
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseException.fromFirebaseAuth(e.code);
    } catch (e) {
     throw UnknownException(errorMessage: e.toString());
    }
  }
  @override
  Future<UserModel?> signInWithGoogle() async {
    try {
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
      var credentialGoogle = await FirebaseAuth.instance.signInWithCredential(credential);
      return UserModel(
        imageUrl: credentialGoogle.user!.photoURL,
        email: credentialGoogle.user!.email,
        id: credentialGoogle.user!.uid,
        name: credentialGoogle.user!.displayName
      );
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseException.fromFirebaseAuth(e.code);
    }catch(e){
      throw UnknownException(errorMessage: e.toString());
    }
  }
  @override
  Future<void> sendEmailVerification()async{
    try {
      await FirebaseAuth.instance.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseException.fromFirebaseAuth(e.code);
    }catch(e){
      throw UnknownException(errorMessage: e.toString());
    }
  }
  @override
  Future<String?>loginWithEmailAndPassword({required String emailAddress, required String password})async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
      return credential.user?.email!;
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseException.fromFirebaseAuth(e.code);
    }catch(e){
      throw UnknownException(errorMessage: e.toString());
    }
  }
  @override
  Future<void> resetPassword(String email)async{
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseException.fromFirebaseAuth(e.code);
    }catch(e){
      throw UnknownException(errorMessage: e.toString());
    }
  }
  @override
  Future<void>changePassword({required String newPassword})async{
    try {
      await FirebaseAuth.instance.currentUser?.updatePassword(newPassword);
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseException.fromFirebaseAuth(e.code);
    }catch(e){
      throw UnknownException(errorMessage: Sentence.somethingWentWrongPleaseTryAgain);
    }
  }

  @override
  Future<void> signOut() async{
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseException.fromFirebaseAuth(e.code);
    }catch (e){
      throw UnknownException(errorMessage: e.toString());
    }
  }
}