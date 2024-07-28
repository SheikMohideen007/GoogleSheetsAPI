import 'package:flutter/material.dart';

class CustomizedTextfield extends StatefulWidget {
  final String text;
  final TextEditingController controller;
  final bool isReadOnly;
  final int maxLines;
  const CustomizedTextfield(
      {super.key,
      required this.text,
      required this.controller,
      required this.maxLines,
      required this.isReadOnly});

  @override
  State<CustomizedTextfield> createState() => _CustomizedTextfieldState();
}

class _CustomizedTextfieldState extends State<CustomizedTextfield> {
  int maxLines = 1;
  @override
  void initState() {
    super.initState();
    setState(() {
      updateMaxLines();
    });
  }

  @override
  Widget build(BuildContext context) {
    double devHeight = MediaQuery.of(context).size.height;
    double devWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${widget.text} : ',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: devHeight * 0.02),
        TextField(
          controller: widget.controller,
          maxLines: maxLines,
          readOnly: widget.isReadOnly,
          decoration: InputDecoration(isDense: true),
          onChanged: (val) {
            setState(() {
              updateMaxLines();
            });
          },
        ),
      ],
    );
  }

  updateMaxLines() {
    String str = widget.controller.text;
    maxLines = widget.maxLines;
    if (str.length > 200) {
      maxLines = 6;
    } else if (str.length > 160) {
      maxLines = 5;
    } else if (str.length > 120) {
      maxLines = 4;
    } else if (str.length > 90) {
      maxLines = 3;
    } else if (str.length > 60) {
      maxLines = 2;
    } else {
      maxLines = 1;
    }
  }
}
