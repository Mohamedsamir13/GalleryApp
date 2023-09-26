import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photoalbm/Core/Apptext/apptext.dart';
import 'package:photoalbm/Features/AlbumsPage/View/Widgets/listView.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
  Future takePhoto() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('success');
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.redAccent,
          onPressed: () {
            pickImage();
          },
          child: const Icon(
            Icons.photo,
          ),
        ),
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.grey[200]),
          title: const Center(
              child: AppText(
            text: "Albums screen",
            fontWeight: FontWeight.w500,
            color: Colors.black,
          )),
          actions: [
            IconButton(onPressed: () {
              takePhoto();
            }, icon: const Icon(Icons.camera_alt,color: Colors.black,))
          ],
        ),
        body: const ListViewWidget());
  }
}
