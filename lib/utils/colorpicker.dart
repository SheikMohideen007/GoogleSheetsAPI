import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

class Colorpicker {
  static Future<bool> colorPickerDialog(
      {required BuildContext context,
      required Function(Color color) onColorChanged}) async {
    return ColorPicker(
      color: Colors.red,
      onColorChanged: onColorChanged,
      width: 30,
      height: 30,
      borderRadius: 4,
      spacing: 5,
      runSpacing: 5,
      wheelDiameter: 125,
      heading: Text(
        'Select color',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subheading: Text(
        'Select color shade',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      showMaterialName: true,
      showColorName: true,
      materialNameTextStyle:
          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      colorNameTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      colorCodeTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      selectedPickerTypeColor: Theme.of(context).colorScheme.primary,
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.both: false,
        ColorPickerType.primary: true,
        ColorPickerType.accent: true,
        ColorPickerType.bw: false,
        ColorPickerType.custom: false,
        ColorPickerType.wheel: false,
      },
    ).showPickerDialog(
      context,
      actionsPadding: EdgeInsets.all(16),
      constraints:
          const BoxConstraints(minHeight: 220, minWidth: 200, maxWidth: 220),
    );
  }
}
