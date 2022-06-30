import 'dart:io';
import 'package:akary/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class SelectImage extends StatefulWidget {
  SelectImage({Key? key}) : super(key: key);

  @override
  State<SelectImage> createState() => _SelectImageState();
}

class _SelectImageState extends State<SelectImage> {
  File? image;

  Future PickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imagetemp = File(image.path);
      setState(() {
        this.image = imagetemp;
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: [
          image != null
              ? Image.file(
                  image!,
                  width: 100,
                  height: 100,
                  fit: BoxFit.fill,
                )
              : Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsojqA-M5BYNXozUF6bWXa3zcw_FWmVF4O3w&usqp=CAU',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'select Image',
            style: TextStyle(
                fontSize: 18,
                color: GetStorage().read('isDarkTheme') == true
                    ? Colors.white
                    : mainColor,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: SizedBox(
              height: 80,
              child: Column(
                children: [
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.camera_alt,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Camera',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    onTap: () {
                      PickImage(ImageSource.camera);
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.image,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Gallery',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    onTap: () {
                      PickImage(ImageSource.gallery);
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                  ),
                ],
              ),
            ),
            backgroundColor: GetStorage().read('isDarkTheme') == true
                ? Colors.black87
                : mainColor,
          ),
        );
      },
    );
  }
}
