//
// import 'package:flutter/material.dart';
//
// class CustomRating extends StatelessWidget{
//   const CustomRating({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return  RatingDialog(
//       initialRating: 0.0,
//       // your app's name?
//
//       title: const Text(
//         'Rating',
//         textAlign: TextAlign.center,
//         style: TextStyle(
//           fontSize: 25,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       message: const Text(
//         'Tap a star to set your rating. Add more description here if you want.',
//         textAlign: TextAlign.center,
//         style: TextStyle(fontSize: 15),
//       ),
//       // your app's logo?
//       image: Image.asset("assets/images/base_images/logo_app.png",height: MediaQuery.of(context).size.height*0.2,),
//       submitButtonText: 'Submit',
//       commentHint: 'Set your custom',
//       onCancelled: () => print('cancelled'),
//       onSubmitted: (response) {
//       },
//     );
//   }
//
// }