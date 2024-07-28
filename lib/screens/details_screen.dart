import 'package:flutter/material.dart';
import 'package:myapp/utils/alerts.dart';
import 'package:myapp/utils/customized_textfield.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

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
  @override
  void initState() {
    super.initState();
    setState(() {
      description.text =
          "Notes Description  sfnjsf jn jsf sjbsfbsf.. kjb jknddfjb  kjbdgf jkndg  jnd kjndfsg  kjndsg kndsf k jdhsbfd jhbdfhb dsafbdfjkbdf fdkjbdfb kjndsjfdf kndfn kjndsf kjbdsf kjbsdf  dksjbfd jbdsfg kjndsf kjbdsf  dskbnds dnk dnm nmd mnd  fdmn gnmd gmn jng nmd gmn dgn dmn gkjh wdj jewbgfjs sdjkndgn dgoiubsn g";
      title.text =
          "Notes Heading jksdjfk kjhdf kjhewf kjbhdf kbsdfkjf kjbdsf fkjbdw fjn dfn  jkbdsf kjhdaf jhbfe kjnd Notes Heading jksdjfk kjhdf kjhewf kjbhdf kbsdfkjf kjbdsf fkjbdw fjn dfn  jkbdsf kjhdaf jhbfe kjnd Notes Heading jksdjfk kjhdf kjhewf kjbhdf kbsdfkjf kjbdsf fkjbdw fjn dfn  jkbdsf kjhdaf jhbfe kjnd Notes Heading ";
      tempTitle = title.text;
      tempDescription = description.text;
    });
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
            !isRead
                ? IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.palette, color: Colors.brown))
                : SizedBox(),
            !isRead
                ? IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.save, color: Colors.green.shade700))
                : SizedBox(),
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
                      description.text == tempDescription) {
                    isRead = true;
                  } else {
                    Alerts.showAlert(
                        context: context,
                        content: 'Do you want to save the changes ?',
                        onYes: () {
                          Navigator.pop(context);
                          isRead = true;
                          print('here need to save the notes');
                        },
                        onNo: () {
                          Navigator.pop(context);
                          //rollback to the previous changes
                          description.text = tempDescription;
                          title.text = tempTitle;
                          isRead = true;
                        });
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
}









 // isImageSelected
                    //     ? SizedBox(
                    //         height: devHeight * 0.05,
                    //       )
                    //     : SizedBox(),
                    // isImageSelected
                    //     ? Padding(
                    //         padding: EdgeInsets.symmetric(
                    //             vertical: devHeight * 0.02),
                    //         child:
                    //             Text('Image', style: TextStyle(fontSize: 20)),
                    //       )
                    //     : SizedBox(),
                    // isImageSelected
                    //     ? Padding(
                    //         padding: EdgeInsets.only(bottom: devHeight * 0.15),
                    //         child: Container(
                    //           height: devHeight * 0.4,
                    //           width: devWidth * 0.8,
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(10),
                    //               color: Colors.grey.shade300),
                    //         ),
                    //       )
                    //     : SizedBox()