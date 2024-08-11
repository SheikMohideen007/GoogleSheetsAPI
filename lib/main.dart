import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/api/gheets_service.dart';
import 'package:myapp/screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await gSheetInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: false, textTheme: GoogleFonts.poppinsTextTheme()),
      home: Home(),
    );
  }
}
