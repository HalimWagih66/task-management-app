
import '../../../models/user_model.dart';

abstract class AuthServices{
    Future<void> resetPassword(String email);
    Future<String?>loginWithEmailAndPassword({required String emailAddress, required String password});
    Future<void> sendEmailVerification();
    Future<UserModel?> signInWithGoogle();
    Future<String?> createUserWithEmailAndPassword({required String emailAddress,required String password});
    Future<void> signOut();

}