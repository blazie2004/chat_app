import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({super.key, required this.onpickimage});
  final void Function(File pickedimage) onpickimage;

  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _pickedimage; //not necessary to be set
  void pickimage() async {
    final pickedimage = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50, maxWidth: 150);
    setState(() {
      if (pickedimage == null) {
        return;
      }
      _pickedimage = File(pickedimage.path);
    });
    widget.onpickimage(_pickedimage!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey,
            foregroundImage:
                _pickedimage != null ? FileImage(_pickedimage!) : null),
        TextButton.icon(
            onPressed: () {
              pickimage();
            },
            icon: Icon(Icons.image),
            label: Text(
              'ADD-IMAGE',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ))
      ],
    );
  }
}
