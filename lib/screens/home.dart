import 'package:flutter/material.dart';
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
                IconButton(onPressed: () {}, icon: Icon(Icons.refresh))
              ],
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: 7,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: devHeight * 0.03,
                      childAspectRatio: 0.7),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailScreen()));
                        },
                        child: NotesCard());
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
