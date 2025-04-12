import 'dart:io';
import 'package:path/path.dart' as path;

class EditPath{
  static String? replaceFileName(String newName,File file) {
    return path.basename(file.path).replaceRange(0, path.basename(file.path).lastIndexOf('.'), newName);
  }
  static String nameEmail(String email) {
    return email.substring(0, email.indexOf("."));
  }
}