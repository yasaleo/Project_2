import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';

import '../../../dataLayer/auth_services.dart';
import '../../constants/constants.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  TextEditingController captionController = TextEditingController();
  File? finalImage;
  @override
  Widget build(BuildContext context) {
    final desize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.COLOR_BLACK,
        title: const Text(
          "Add Post",
          style: TextStyle(
            color: Constants.COLOR_WHITE,
          ),
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromWidth(10),
              maximumSize: const Size.fromWidth(90),
            ),
            onPressed: () async {
              if (finalImage != null) {
                await Authsevices()
                    .createPost(captionController.text, finalImage!, context);
                Navigator.pop(context);
              } else {}
            },
            child: const Text(
              "post",
              style: TextStyle(color: Constants.COLOR_BLACK),
            ),
          )
        ],
      ),
      backgroundColor: Constants.COLOR_SCAFFOLD_BACKGROUND,
      body: Center(
        child: Column(
          children: [
            captionFeild(desize),
            imageFeild(desize),
          ],
        ),
      ),
    );
  }

  Widget imageFeild(Size desize) {
    return GestureDetector(
      onTap: () {
        pickImage();
      },
      child: finalImage == null
          ? Icon(
              Ionicons.image_outline,
              color: Constants.COLOR_WHITE,
              size: desize.height * 3 / 10,
            )
          : Image.file(
              finalImage!,
              fit: BoxFit.fill,
              height: desize.height * 3 / 10,
            ),
    );
  }

  Align captionFeild(Size desize) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SizedBox(
          width: desize.width * 7 / 10,
          child: TextFormField(
            controller: captionController,
            style: const TextStyle(
              color: Constants.COLOR_WHITE,
              fontWeight: FontWeight.w600,
            ),
            cursorColor: Constants.COLOR_WHITE,
            decoration: const InputDecoration(
              hintText: "enter here ...",
              label: Text("caption"),
              labelStyle: TextStyle(color: Constants.COLOR_WHITE),
              hintStyle: TextStyle(
                color: Constants.COLOR_WHITE,
              ),
              disabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }

  Future pickImage() async {
    Constants().showLoading(context);
    final imagepath = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 20);
    if (imagepath == null) {
      return;
    } else {
      final img = File(imagepath.path);
      setState(() {
        finalImage = img;
        Navigator.of(context).pop();
      });
    }
  }
}
