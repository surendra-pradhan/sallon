import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sallon/providers/userdata.dart';
import 'package:sallon/widgets/imagepicker.dart';
import 'dart:io';

class ProfileSetting extends StatefulWidget {
  static const routerName = '/profileSettings';

  @override
  _ProfileSettingState createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  File _storedImage;
  Future<void> _onSetImage(File getImage) async {
    setState(() {
      if (getImage != null) {
        _storedImage = File(getImage.path);
      } else {
        print('No image selected.');
      }
    });
  }

  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  void _onSave() {
    Provider.of<Userdata>(context, listen: false).addUser(
        _nameController.text, int.parse(_mobileController.text), _storedImage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Settings'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              children: <Widget>[
                Align(
                  child: ClipOval(
                    child: new SizedBox(
                      width: 180.0,
                      height: 180.0,
                      child: _storedImage == null
                          ? Image.network(
                              "https://img.freepik.com/free-photo/pleasant-looking-serious-man-stands-profile-has-confident-expression-wears-casual-white-t-shirt_273609-16959.jpg?size=626&ext=jpg",
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                              _storedImage,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
                ProfileImagePicker(_onSetImage),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: "Name"),
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Mobile"),
                  controller: _mobileController,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _onSave,
                    child: Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
