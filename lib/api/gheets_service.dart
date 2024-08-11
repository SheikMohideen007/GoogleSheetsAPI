import 'package:gsheets/gsheets.dart';

import 'package:myapp/api/api_Key.dart';

String sheetId = APIKey.sheetId;
String sheetName = "Notes";

String key = APIKey.key;

late GSheets credential;
Worksheet? worksheet;

Spreadsheet? controller;

gSheetInit() async {
  try {
    credential = GSheets(key);

    controller = await credential.spreadsheet(sheetId);
    print("controller... ${controller!.sheets}");
    worksheet = controller!.worksheetByTitle(sheetName);

    print("initialized... ${worksheet!.title}");
  } on Exception catch (e) {
    print('404...$e');
  }
}
