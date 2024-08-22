class FirebaseStorageConstant{
  static const userImageFileName = "person_image";
  static const categories = "categories";
  static const person = "person";
  static const tasks = "tasks";
  static String getPathTheImage({required String email,required String folderName}){
    return "$email/images/$folderName";
  }
}