// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/cupertino.dart';
//
// class Database {
//   static late FirebaseStorage storage;
//   static late final List<Widget> movieCovers = [];
//
//   init() async {
//     await Firebase.initializeApp();
//     storage = FirebaseStorage.instance;
//     final ListResult allRef =
//         await FirebaseStorage.instance.ref("covers/").listAll();
//     for (var ref in allRef.items) {
//       // movieCovers.add(ImageSrc(src: await storage.ref(ref).getDownloadURL()));
//     }
//
//     // storage.ref(storageRef.fullPath).getDownloadURL();
//   }
// }
//
// class ImageSrc extends StatelessWidget {
//   late String src;
//   ImageSrc({Key? key, required this.src}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Image.network(src);
//   }
// }
