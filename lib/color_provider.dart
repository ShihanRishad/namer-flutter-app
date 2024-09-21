
import 'package:flutter/material.dart';
 import
 'package:flutter_colorpicker/flutter_colorpicker.dart';

 class ColorProvider with ChangeNotifier {
   Color _primaryColor = Color.fromARGB(255, 21, 223, 125); // Initial color

   Color get primaryColor => _primaryColor;

   void changeColor(Color color) {
     _primaryColor = color;
     notifyListeners();
   }

   void showColorPicker(BuildContext context) {
     showDialog(
       context: context,
       builder: (context) => AlertDialog(
         title: const Text('Pick a color!'),
         content: SingleChildScrollView(
           child: ColorPicker(
             pickerColor: _primaryColor,
             onColorChanged: changeColor,
             pickerAreaHeightPercent: 0.8,
           ),
         ),
         actions: <Widget>[
           TextButton(
             child: const Text('Got it'),
             onPressed: () {
               Navigator.of(context).pop();
             },
           ),
         ],
       ),
     );
   }
 }
