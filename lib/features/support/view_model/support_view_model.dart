import 'dart:io';

import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
abstract class SupportNavigator{
  void showMessageSnackPar({required String message});
}
 class SupportViewModel{
   SupportNavigator? navigator;
   Future<void>sendWhatsappMessage() async {
    String url(){
      String phoneNumber = "+201204956203";
      String message = "can you help me";
      if(Platform.isIOS){
        return "https://wa.me/$phoneNumber/?text=${Uri.parse(message)}";
      }else{
        return "https://send?phone=$phoneNumber&text=$message";
      }
    }
    await canLaunchUrlString(url())?launchUrlString(url()):navigator?.showMessageSnackPar(message: "Something went wrong");
  }
   Future<void>callPhoneNumber() async {
     await canLaunchUrlString("tel:+201204956203")?launchUrlString("tel:+201204956203"):navigator?.showMessageSnackPar(message: "Something went wrong");
   }
   Future<void>messenger() async {
     await canLaunchUrlString("https:m.me/souqik")?launchUrlString("https:m.me/souqik"):navigator?.showMessageSnackPar(message: "Something went wrong");
   }
   Future<void>sms() async {
     await canLaunchUrlString("sms:+201204956203")?launchUrlString("sms:+201204956203"):navigator?.showMessageSnackPar(message: "Something went wrong");
   }
   Future<void>mail() async {
     final uri = Uri(
       scheme: "mailto",
       path: "halemwagih6@gmail.com",
     );

     await canLaunchUrl(uri)?launchUrl(uri):navigator?.showMessageSnackPar(message: "Something went wrong");
   }
}