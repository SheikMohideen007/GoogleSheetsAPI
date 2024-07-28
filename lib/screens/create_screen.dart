import 'package:flutter/material.dart';
import 'package:myapp/utils/customized_textfield.dart';

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
        backgroundColor: Colors.white,
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
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.palette, color: Colors.brown)),
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
        floatingActionButton:  FloatingActionButton.extended(
                onPressed: () {
                  Navigator.pop(context);
                },
                label: Row(
                  children: [
                    Text('Save', style: TextStyle(color: Colors.black)),
                    SizedBox(width: devWidth * 0.02),
                    Icon(Icons.book, color: Colors.black)
                  ],
                ))
           
      ),
    );
  }
}
