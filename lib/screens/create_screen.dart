import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:myapp/utils/colorpicker.dart';
import 'package:myapp/utils/customized_textfield.dart';
import 'package:myapp/utils/snackbar.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  double devHeight = 0.0, devWidth = 0.0;
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  int titleMaxLines = 1;
  int descriptionMaxLines = 1;
  bool isImageSelected = false;
  Color color = Colors.white;
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    devHeight = MediaQuery.of(context).size.height;
    devWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          backgroundColor: color,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios, color: Colors.black)),
            actions: [
              Row(
                children: [
                  Text('Choose color palette',
                      style: TextStyle(color: Colors.black)),
                  SizedBox(width: devWidth * 0.02),
                  GestureDetector(
                    onTap: () => Colorpicker.colorPickerDialog(
                        context: context,
                        onColorChanged: (color) {
                          setState(() {
                            this.color = color;
                          });
                        }),
                    child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: SizedBox(
                          width: devWidth * 0.08,
                          child: Image.asset('images/palette.png')),
                    ),
                  ),
                ],
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: devHeight * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: devWidth * 0.05),
                  child: Column(
                    children: [
                      CustomizedTextfield(
                        text: "Title",
                        controller: title,
                        maxLines: titleMaxLines,
                        isReadOnly: false,
                      ),
                      SizedBox(
                        height: devHeight * 0.03,
                      ),
                      CustomizedTextfield(
                        text: "Description",
                        controller: description,
                        maxLines: descriptionMaxLines,
                        isReadOnly: false,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                if (title.text.isEmpty || description.text.isEmpty) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackbarUtil.snack);
                } else {
                  Navigator.pop(context);
                }
              },
              label: Row(
                children: [
                  Text('Save', style: TextStyle(color: Colors.black)),
                  SizedBox(width: devWidth * 0.02),
                  Icon(Icons.book, color: Colors.black)
                ],
              ))),
    );
  }
}
