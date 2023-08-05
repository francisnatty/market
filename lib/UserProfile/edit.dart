import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController controller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  List<String> images = [
    'assets/girl.jpg',
    'assets/girltwo.jpg',
    '',
    '',
    '',
  ];

  PlatformFile? file;
  String? path;
  bool isItemSelected = false;
  String dropdownValue = 'Why are you searching for a partner?';
  Future pickImage() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        file = result.files.first;
        path = file!.path;

        print(file!.path);
        setState(() {});
      } else {
        print('error picking photo');
      }
    } catch (e) {
      print('error is ${e}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.pink,
                )),
            actions: [],
            title: Text(
              'Upload Page',
              style: TextStyle(fontSize: 18),
            )),
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Text(
                    //     'To upload an image it is required that you pick an image and answer,thank you'),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.pink)),
                        child: dropDown()),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a text';
                            } else if (value.length < 30 && value.isNotEmpty) {
                              return 'Text cant be less than 30';
                            }
                            return null;
                          },

                          maxLines: null,
                          // maxLength: 30,
                          // minLines: 30,
                          maxLength: 500,
                          textInputAction: TextInputAction.next,
                          controller: controller,
                          decoration: InputDecoration(
                              hintText: 'Enter your Thoughts here',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 0.0),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.pink, width: 0.0),
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.pink))),
                          // onChanged: (value) {
                          //   value = controller.text;
                          //   print(value);
                          // },
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    path != null
                        ? SizedBox.shrink()
                        : TextButton(
                            onPressed: () {
                              pickImage();
                              //bottomSheet(context);
                            },
                            child: Text(
                              'Select Image',
                              style: TextStyle(color: Colors.pink),
                            )),
                    path != null
                        ? Container(
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    icon: Icon(
                                      Iconsax.close_square,
                                      color: Colors.pink,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        path = null;
                                      });
                                    },
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(40),
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height / 2,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.file(
                                        File(
                                          path!,
                                        ),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 20,
                    ),
                    path != null
                        ? ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                        Colors.pinkAccent)),
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                // ScaffoldMessenger.of(context).showSnackBar(
                                //   const SnackBar(content: Text('Processing Data')),
                                // );
                              } else if (controller.text.isNotEmpty) {}
                              null;
                            },
                            child: Text(
                              'Upload Photo',
                              style: TextStyle(color: Colors.white),
                            ))
                        : SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  DropdownButton<String> dropDown() {
    return DropdownButton<String>(
        value: dropdownValue,
        elevation: 0,
        isExpanded: true,
        style: TextStyle(fontSize: 15),
        dropdownColor: Colors.pink.shade200,
        underline: SizedBox(),
        icon: Icon(Icons.arrow_drop_down),
        items: <String>[
          'Why are you searching for a partner?',
          'What do you think about love?',
          'Would you love to go on date?',
          'what do you think about love at first sight?',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(
                  fontSize: 15, color: Colors.black, fontFamily: 'Montserrat'),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
            isItemSelected = true;
          });
        });
  }
}
