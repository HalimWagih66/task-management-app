
import 'exceptions.dart';

class CustomFirebaseException extends CustomException {
  CustomFirebaseException({required super.errorMessage});

  factory CustomFirebaseException.fromFirebaseAuth(String message) {
    switch (message) {
      case "user-not-found":
        return CustomFirebaseException(
            errorMessage: "No user found for that email.");
      case "wrong-password":
        return CustomFirebaseException(
            errorMessage: "Wrong password provided for that user.");
      case "invalid-credential":
        return CustomFirebaseException(
            errorMessage:
                "email or password is wrong , please enter email and password are correct ");
      case "requires-recent-login":
        return CustomFirebaseException(
            errorMessage: "Log out, then log in, then re-enter your password.");
      case 'account-exists-with-different-credential':
        return CustomFirebaseException(
            errorMessage:
                "The account already exists with a different credential");
      case 'provider-already-linked':
        return CustomFirebaseException(
            errorMessage: "The provider has already been linked to the user.");
      case "credential-already-in-use":
        return CustomFirebaseException(
            errorMessage:
                "The account corresponding to the credential already exists, or is already linked to a Firebase User.");
      case "no-such-provider":
        return CustomFirebaseException(
            errorMessage:
                "The user isn't linked to the provider or the provider doesn't exist.");
      case "operation-not-allowed":
        return CustomFirebaseException(
            errorMessage:
                "Anonymous auth hasn't been enabled for this project.");
      case "invalid-custom-token":
        return CustomFirebaseException(
            errorMessage:
                "The supplied token is not a Firebase custom auth token.");
      case "custom-token-mismatch":
        return CustomFirebaseException(
            errorMessage:
                "The supplied token is for a different Firebase project.");
      case 'invalid-phone-number':
        return CustomFirebaseException(
            errorMessage: 'The provided phone number is not valid.');
      default:
        return CustomFirebaseException(
            errorMessage: "Oops There was an error, Please Try again");
    }
  }

  factory CustomFirebaseException.fromFirebaseStorage(String message) {
    switch (message) {
      case "storage/unknown":
        return CustomFirebaseException(
            errorMessage: "An unknown error occurred.");
      case "storage/object-not-found":
        return CustomFirebaseException(
            errorMessage: "No object exists at the desired reference.");
      case "storage/bucket-not-found":
        return CustomFirebaseException(
            errorMessage: "No bucket is configured for Cloud Storage");
      case "storage/project-not-found":
        return CustomFirebaseException(
            errorMessage: "No project is configured for Cloud Storage");
      case "storage/quota-exceeded":
        return CustomFirebaseException(
            errorMessage:
                "Quota on your Cloud Storage bucket has been exceeded. If you're on the no-cost tier, upgrade to a paid plan. If you're on a paid plan, reach out to Firebase support.");
      case "storage/unauthenticated":
        return CustomFirebaseException(
            errorMessage:
                "User is unauthenticated, please authenticate and try again.");
      case "storage/unauthorized":
        return CustomFirebaseException(
            errorMessage:
                "User is not authorized to perform the desired action, check your security rules to ensure they are correct.");
      case "storage/retry-limit-exceeded":
        return CustomFirebaseException(
            errorMessage:
                "The maximum time limit on an operation (upload, download, delete, etc.) has been excceded. Try uploading again.");
      case "storage/invalid-checksum":
        return CustomFirebaseException(
            errorMessage:
                "File on the client does not match the checksum of the file received by the server. Try uploading again.");
      case "storage/canceled":
        return CustomFirebaseException(
            errorMessage: "User canceled the operation.");
      case "storage/invalid-event-name":
        return CustomFirebaseException(
            errorMessage:
                "Invalid event name provided. Must be one of [running, progress, pause]");
      case "storage/invalid-url":
        return CustomFirebaseException(errorMessage: "Invalid URL");
      case "storage/invalid-argument":
        return CustomFirebaseException(errorMessage: "Invalid Argument");
      case "storage/no-default-bucket":
        return CustomFirebaseException(
            errorMessage:
                "No bucket has been set in your config's storageBucket property.");
      case "storage/cannot-slice-blob":
        return CustomFirebaseException(
            errorMessage:
                "Commonly occurs when the local file has changed (deleted, saved again, etc.). Try uploading again after verifying that the file hasn't changed.");
      case "storage/server-file-wrong-size":
        return CustomFirebaseException(
            errorMessage:
                "File on the client does not match the size of the file received by the server. Try uploading again.");
      default:
        return CustomFirebaseException(
            errorMessage: "Oops There was an error, Please Try again");
    }
  }
}
