import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils/alerts.dart';

class NotesCard extends StatelessWidget {
  // final Colors
  const NotesCard({super.key});

  @override
  Widget build(BuildContext context) {
    double devHeight = MediaQuery.of(context).size.height,
        devWidth = MediaQuery.of(context).size.width;
    return SizedBox(
        height: devHeight * 0.4,
        width: devWidth * 0.45,
        child: Card(
          color: Colors.blue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: devHeight * 0.01),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: devWidth * 0.02),
                  child: Text(
                      'Notes Heading jksdjfk kjhdf kjhewf kjbhdf kbsdfkjf kjbdsf fkjbdw fjn dfn  jkbdsf kjhdaf jhbfe kjnd',
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
                          'Notes Description  sfnjsf jn jsf sjbsfbsf.. kjb jknddfjb  kjbdgf jkndg  jnd kjndfsg  kjndsg kndsf k jdhsbfd jhbdfhb dsafbdfjkbdf fdkjbdfb kjndsjfdf kndfn kjndsf kjbdsf kjbsdf  dksjbfd jbdsfg kjndsf kjbdsf  dskbnds dnk dnm nmd mnd  fdmn gnmd gmn jng nmd gmn dgn dmn gkjh wdj jewbgfjs sdjkndgn dgoiubsn g',
                          style: TextStyle(
                              fontSize: 12, overflow: TextOverflow.ellipsis),
                          maxLines: 7,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: 'Last Updated\nat ',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                    ),
                                  ),
                                  children: [
                                    TextSpan(
                                        text: ' 20-07-24',
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
                                    Navigator.pop(context);
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
