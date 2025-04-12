// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../../../../../../core/utils/widgets/dialogs/show_dialog_upload_image.dart';
// import '../../manager/change_image_cubit/change_image_cubit.dart';
// import 'custom_picked_image_for_change.dart';
//
// class CustomPickedImageForChangeBody extends StatefulWidget {
//   const CustomPickedImageForChangeBody({
//     super.key,
//     required this.imageUrl, required this.fileName, required this.pathTheFile,required this.uid
//   });
//
//   final String? imageUrl;
//   final String fileName;
//   final String pathTheFile;
//   final String uid;
//
//   @override
//   State<CustomPickedImageForChangeBody> createState() => _CustomPickedImageForChangeBodyState();
// }
//
// class _CustomPickedImageForChangeBodyState extends State<CustomPickedImageForChangeBody> {
//   @override
//   Widget build(BuildContext context) {
//     return CustomPickedImageForChange(
//         imageUrl: widget.imageUrl!,
//         onTap: () {
//           showDialogUploadImage(
//             context: context,
//             onPressedCamera: () async {
//               await BlocProvider.of<ChangeImageCubit>(context).changeImageByCamera(fileName: widget.fileName,pathTheFile: widget.pathTheFile,uid: widget.uid);
//             },
//             onPressedGallery: () async {
//               await BlocProvider.of<ChangeImageCubit>(context).changeImageByGallery(fileName: widget.fileName,pathTheFile: widget.pathTheFile,uid: widget.uid);
//             },
//           );
//         },
//       );
//   }
// }
