import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../dio_plugin/dio_util.dart';

class ImageSelectionWidget extends StatefulWidget {
  const ImageSelectionWidget({Key? key}) : super(key: key);

  @override
  State<ImageSelectionWidget> createState() => _ImageSelectionWidgetState();
}

class _ImageSelectionWidgetState extends State<ImageSelectionWidget> {
  String filePath = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Selection'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: Card(
                child: filePath.isEmpty
                    ? const Icon(
                        Icons.person,
                        size: 200,
                      )
                    : Image.file(File(filePath)),
              ),
            ),
            Row(
              children: [
                TextButton(
                    onPressed: _selectImage,
                    child: const Text('Select Image')), // select Image
                TextButton(
                    onPressed: () => uploadFile(filePath),
                    child: const Text('Dio')),
                TextButton(
                    onPressed: () {},
                    child: const Text('Http')), // Any one method from http
              ],
            )
          ],
        ),
      ),
    );
  }

  void _selectImage() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      filePath = file?.path ?? '';
    });
  }
}
