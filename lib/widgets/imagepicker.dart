import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImagePicker extends StatelessWidget {
  final Function getimage;
  ProfileImagePicker(this.getimage);

  Future<void> _onSetImage(String chossevalue) async {
    File _storedImage;
    PickedFile pickedFile;
    final _picker = ImagePicker();
    if (chossevalue == 'camera') {
      pickedFile =
          await _picker.getImage(source: ImageSource.camera, maxWidth: 300);
    } else if (chossevalue == 'gallery') {
      pickedFile =
          await _picker.getImage(source: ImageSource.gallery, maxWidth: 300);
    }

    if (pickedFile == null) {
      return;
    }
    _storedImage = File(pickedFile.path);
    getimage(_storedImage);
  }

  void _showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cameraButton = TextButton(
      child: Text("Open Camera"),
      onPressed: () {
        _onSetImage('camera');
        Navigator.of(context).pop();
      },
    );
    Widget galleryButton = TextButton(
        child: Text("Open Gaellery"),
        onPressed: () => {_onSetImage('gallery'), Navigator.of(context).pop()});
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Chosse one"),
      content: Text("would you like to continue?"),
      actions: [
        cameraButton,
        galleryButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200.0,
        height: 180.0,
        child: Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            child: Icon(
              Icons.flip_camera_ios_outlined,
              color: Colors.white,
            ),
            onPressed: () => _showAlertDialog(context),
          ),
        ),
      ),
    );
  }
}
