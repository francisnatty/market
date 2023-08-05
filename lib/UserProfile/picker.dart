import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerr extends StatefulWidget {
  const ImagePickerr({super.key});

  @override
  State<ImagePickerr> createState() => _ImagePickerrState();
}

class _ImagePickerrState extends State<ImagePickerr> {
  Future<void> _showImagePickerDialog(BuildContext context) async {
    PickedFile? pickedFile;

    // Show alert dialog with input field
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose an Image'),
          content: TextFormField(
            // Add any input validation, if needed
            // For example, you can validate whether the entered URL is a valid image URL.
            decoration: InputDecoration(labelText: 'Image URL'),
            onChanged: (String value) {
              // You can do something with the entered value if needed.
              // For example, store it in a variable or a state.
            },
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Pick Image'),
              onPressed: () async {
                // Call the image picker
                //     pickedFile =
                //          await ImagePicker.pickImage(
                //   source: source,
                //   maxWidth: maxWidth,
                //   maxHeight: maxHeight,
                //   imageQuality: quality,
                // );
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

    // Check if an image was picked, then use it.
    if (pickedFile != null) {
      // Use the pickedFile variable to access the image.
      //  File imageFile = File(pickedFile!.path);

      // Now you can do something with the imageFile, such as displaying it.
      // For example, you can use it in an Image widget.
      // Image.file(imageFile);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _showImagePickerDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          TextButton(
              onPressed: () {
                showAboutDialog(context: context);
              },
              child: Text('click')),
        ],
      )),
    );
  }
}
