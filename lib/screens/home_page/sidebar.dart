import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../models/userprofile_model.dart';
import '../../services/http_services.dart';

class USerProfile001 extends StatefulWidget {
  const USerProfile001({Key? key}) : super(key: key);

  @override
  State<USerProfile001> createState() => _USerProfile001State();
}

class _USerProfile001State extends State<USerProfile001> {
  File? profileimage;
  //get image from image picker
  Future getImage(ImageSource source) async {
    final profileimage = await ImagePicker().pickImage(source: source);
    setState(() {
      this.profileimage = File(profileimage!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  //widget for appbar
  _buildAppbar() {
    return AppBar(
      title: const Text('User Profile'),
    );
  }

  _buildBody() {
    final profile = Provider.of<AuthenticationService>(context);
    return FutureBuilder<UserProfileModel>(
      future: profile.getProfile(),
      builder: (index, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              (snapshot.data!.data!.image == null)
                  ? (profileimage == null)
                  ? InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => _buildDialog());
                },
                child: Container(
                  height: 100,
                  width: 100,
                  child: Image.network(
                      'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png'),
                ),
              )
                  : InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => _buildDialog());
                },
                child: Container(
                    height: 100,
                    width: 100,
                    child: Image.file(profileimage!)),
              )
                  : Container(
                height: 100,
                width: 100,
                child: Image.network(
                    (snapshot.data!.data!.image.toString())),
              ),
              Text(snapshot.data!.data!.name.toString()),
              Text(snapshot.data!.data!.email.toString()),
              Text(snapshot.data!.data!.phone.toString()),
            ],
          );
        } else {
          return Text('No data');
        }
      },
    );
  }

  _buildDialog() {
    return Dialog(
      child: Container(
        height: 200,
        width: 200,
        child: Column(
          children: [
            Text('Choose Image'),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      getImage(ImageSource.camera);
                      print("Camera image path $profileimage");
                    },
                    child: Text('Camera')),
                TextButton(
                    onPressed: () {
                      getImage(ImageSource.gallery);
                      print("Gallery image path $profileimage");
                    },
                    child: Text('Gallery')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
