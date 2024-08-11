
import 'package:task_management_app/core/utils/functions/validate/regex.dart';

class ValidateInputsFromTextValid{
  static String? validateEmailValid(String? input){
    if (input?.isEmpty == true || input?.trim().isEmpty == true) {
      return "Please_enter_email_address";
    }
    if (!Regex.isEmailValid(input!)) {
      return "Please enter the email correctly";
    }
    return null;
  }
  static String? validatePasswordValid(String? input){
    if (input?.isEmpty == true || input?.trim().isEmpty == true) {
      return "Please enter password";
    }
    else if (input!.length < 6) {
      return "Please enter a password that is more than 6 digits";
    }
    return null;
  }
  static String? validateConfirmPasswordValid(
      {required String firstPassword, required String secondPassword}){
    if (firstPassword != secondPassword) {
      return "password does not match";
    }
    return null;
  }
  static String? validateNameValid(String? input) {
    if (input == null || input.trim().isEmpty == true) {
      return "Please enter your name";
    }
    if (input.contains(" ") != true) {
      return "Please enter at least a binary name";
    }
    return null;
  }
}