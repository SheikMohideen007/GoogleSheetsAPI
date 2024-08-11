import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:myapp/api/gsheet_crud.dart';
import 'package:myapp/screens/home.dart';
import 'package:myapp/utils/alerts.dart';
import 'package:myapp/utils/colorpicker.dart';
import 'package:myapp/utils/customized_textfield.dart';
import 'package:myapp/utils/snackbar.dart';

class DetailScreen extends StatefulWidget {
  final List note;
  const DetailScreen({super.key, required this.note});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  double devHeight = 0.0, devWidth = 0.0;
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  String tempTitle = "", tempDescription = "";
  int titleMaxLines = 1;
  int descriptionMaxLines = 1;
  bool isImageSelected = false;
  bool isRead = true;
  Color color = Colors.white;
  Color tempColor = Colors.white;
  @override
  void initState() {
    super.initState();
    setState(() {
      print(widget.note);
      title.text = widget.note[1];
      description.text = widget.note[2];
      color = widget.note[3];
      tempTitle = title.text;
      tempDescription = description.text;
      tempColor = color;
    });
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
            !isRead
                ? Row(
                    children: [
                      Text('Change palette',
                          style: TextStyle(color: Colors.black)),
                      SizedBox(width: devWidth * 0.02),
                      GestureDetector(
                        //opening the color dialog picker to set the notes background
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
                      )
                    ],
                  )
                : SizedBox(),
            !isRead
                ? IconButton(
                    onPressed: () {
                      if (title.text == tempTitle &&
                          description.text == tempDescription &&
                          tempColor == color) {
                        SnackbarUtil.viewSnackBar(
                            text: 'No Changes Found', context: context);
                      } else {
                        saveAlert(context);
                      }
                    },
                    icon: Icon(Icons.save, color: Colors.green.shade700))
                : SizedBox(),
            IconButton(
                onPressed: () {
                  Alerts.showAlert(
                    content: 'Do you want to delete?',
                    context: context,
                    onYes: () {
                      GsheetCrud.deleteNotes(key: widget.note[0]);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    onNo: () {
                      Navigator.pop(context);
                    },
                  );
                },
                icon: Icon(Icons.delete, color: Colors.red))
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    isRead
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Text('Title : ',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: devHeight * 0.02),
                                Text(title.text)
                              ])
                        : CustomizedTextfield(
                            text: "Title",
                            controller: title,
                            maxLines: titleMaxLines,
                            isReadOnly: isRead,
                          ),
                    SizedBox(
                      height: devHeight * 0.03,
                    ),
                    isRead
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Text('Description : ',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: devHeight * 0.02),
                                Text(description.text)
                              ])
                        : CustomizedTextfield(
                            text: "Description",
                            controller: description,
                            maxLines: descriptionMaxLines,
                            isReadOnly: isRead,
                          ),
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              setState(() {
                if (isRead) {
                  isRead = false;
                } else {
                  if (title.text == tempTitle &&
                      description.text == tempDescription &&
                      tempColor == color) {
                    isRead = true;
                  } else {
                    saveAlert(context);
                  }
                }
              });
            },
            label: Row(
              children: [
                Text(!isRead ? 'Back to read' : 'Edit notes',
                    style: TextStyle(color: Colors.black)),
                SizedBox(width: devWidth * 0.02),
                Icon(!isRead ? Icons.book : Icons.edit, color: Colors.black)
              ],
            )),
      ),
    );
  }

  Widget saveAlert(BuildContext context) {
    return Alerts.showAlert(
        context: context,
        content: 'Do you want to save the changes ?',
        onYes: () {
          Navigator.pop(context);
          List note = ["", "", "", widget.note[4], ""];
          //here, skipping the id in the note list
          note[0] = title.text;
          note[1] = description.text;
          note[2] = color.toString();
          note[4] = DateTime.now().toString();
          GsheetCrud.updateNotes(key: widget.note[0], note: note);
          isRead = true;
        },
        onNo: () {
          Navigator.pop(context);
          //rollback to the previous changes
          description.text = tempDescription;
          title.text = tempTitle;
          color = tempColor;
          isRead = true;
        });
  }
}
