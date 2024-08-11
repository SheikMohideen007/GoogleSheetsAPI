import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/api/gsheet_crud.dart';
import 'package:myapp/screens/home.dart';
import 'package:myapp/utils/alerts.dart';

class NotesCard extends StatelessWidget {
  final String title, description, time, id;
  final bool isEdited;
  final Color color;
  const NotesCard(
      {super.key,
      required this.title,
      required this.description,
      required this.isEdited,
      required this.time,
      required this.id,
      required this.color});

  @override
  Widget build(BuildContext context) {
    double devHeight = MediaQuery.of(context).size.height,
        devWidth = MediaQuery.of(context).size.width;
    return SizedBox(
        height: devHeight * 0.4,
        width: devWidth * 0.45,
        child: Card(
          color: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: devHeight * 0.01),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: devWidth * 0.02),
                  child: Text(title,
                      style: TextStyle(
                          fontSize: 19, overflow: TextOverflow.ellipsis)),
                ),
                Divider(color: Colors.white),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: devWidth * 0.015),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          description,
                          style: TextStyle(
                              fontSize: 12, overflow: TextOverflow.ellipsis),
                          maxLines: 7,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: isEdited
                                      ? 'Last Updated\nat '
                                      : 'Created\nat ',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                    ),
                                  ),
                                  children: [
                                    TextSpan(
                                        text: ' $time',
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                          ),
                                        ))
                                  ]),
                            ),
                            IconButton(
                              onPressed: () {
                                Alerts.showAlert(
                                  content: 'Do you want to delete?',
                                  context: context,
                                  onYes: () {
                                    GsheetCrud.deleteNotes(key: id);
                                  },
                                  onNo: () {
                                    Navigator.pop(context);
                                  },
                                );
                              },
                              icon: Icon(Icons.delete, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
