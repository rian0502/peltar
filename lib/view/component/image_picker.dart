import 'package:flutter/material.dart';


class FormImagePicker extends StatelessWidget {
  const FormImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF134A6E)),
      ),
      child: const Padding(
        padding: EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
        child: Center(
          child: Icon(Icons.upload_file, color: Color(0xFF134A6E), size: 48.0),
        ),
      ),
    );
  }
}
