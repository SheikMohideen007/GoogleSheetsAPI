import 'package:myapp/api/gheets_service.dart';

class GsheetCrud {
  static void addNotes(List note) async {
    try {
      await worksheet!.values.appendRow(note);
    } on Exception catch (e) {
      print('Something went wrong ... $e');
    }
  }

  static Future<List<List<String>>> readNotes() async {
    try {
      return await worksheet!.values.allRows();
    } on Exception catch (e) {
      print('Something went wrong ... $e');
      return [];
    }
  }

  static void updateNotes({required String key, required List note}) async {
    try {
      await worksheet!.values.insertRowByKey(key, note);
    } on Exception catch (e) {
      print('Something went wrong ... $e');
    }
  }

  static void deleteNotes({required String key}) async {
    try {
      //here deleting the row by getting its index from the key
      int index = await worksheet!.values.rowIndexOf(key);
      await worksheet!.deleteRow(index);
    } on Exception catch (e) {
      print('Something went wrong ... $e');
    }
  }
}
