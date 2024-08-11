import 'package:flutter/material.dart';
import 'package:myapp/api/gsheet_crud.dart';
import 'package:myapp/screens/create_screen.dart';
import 'package:myapp/screens/details_screen.dart';
import 'package:myapp/utils/notes_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double devHeight = 0.0, devWidth = 0.0;
  List<List<String>> notes = [];

  @override
  void initState() {
    super.initState();
    getNotes();
  }

  getNotes() async {
    final list = await GsheetCrud.readNotes();
    setState(() {
      notes = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    devHeight = MediaQuery.of(context).size.height;
    devWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CreateScreen()));
          },
          label: Row(
            children: [Icon(Icons.add), SizedBox(width: 5), Text('Create New')],
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: devHeight * 0.05, horizontal: devWidth * 0.05),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Notes App', style: TextStyle(fontSize: 32)),
                IconButton(
                    onPressed: () {
                      setState(() {
                        getNotes();
                      });
                    },
                    icon: Icon(Icons.refresh))
              ],
            ),
            notes.isEmpty
                ? Center(child: Text('No notes found'))
                : Expanded(
                    child: GridView.builder(
                        itemCount: notes.length - 1,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: devHeight * 0.03,
                            childAspectRatio: 0.7),
                        itemBuilder: (context, index) {
                          List<String> note = notes[index + 1];
                          String title = note[1];
                          String description = note[2];
                          String time = note[4];
                          DateTime dt =
                              convertExcelDateToDateTime(double.parse(time));
                          time =
                              '${dt.day < 10 ? '0${dt.day}' : dt.day}-${dt.month < 10 ? '0${dt.month}' : dt.month}-${dt.year}';
                          // Color color = note[4] as Color;
                          String colorStr = note[3];
                          try {
                            colorStr = note[3].split(" ")[2];
                            colorStr =
                                colorStr.substring(0, colorStr.length - 1);
                          } catch (e) {
                            colorStr = note[3];
                          }
                          colorStr = colorStr
                              .replaceAll('Color(', "")
                              .replaceAll(')', '');
                          Color color = Color(int.parse(colorStr));
                          String isEdited = note[5];
                          bool isEdit = false;
                          if (isEdited != 'none') {
                            isEdit = true;
                          }
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailScreen(
                                                note: [
                                                  note[0],
                                                  note[1],
                                                  note[2],
                                                  color,
                                                  note[4],
                                                  note[5]
                                                ])));
                              },
                              child: NotesCard(
                                  id: note[0],
                                  title: title,
                                  description: description,
                                  isEdited: isEdit,
                                  time: time,
                                  color: color));
                        }),
                  ),
          ],
        ),
      ),
    );
  }

  DateTime convertExcelDateToDateTime(double excelDate) {
    // Excel's date system starts at 30th December 1899
    final int millisecondsSinceEpoch = ((excelDate - 25569) * 86400000).toInt();
    return DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch,
        isUtc: true);
  }
}
