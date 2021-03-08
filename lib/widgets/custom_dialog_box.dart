import 'package:flutter/material.dart';

class CustomDialogBox extends StatefulWidget {
  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: ListView.builder(
        itemBuilder: (context, number) {
          return Text('Tag $number');
        },
        itemCount: 10,
      ),
    );
  }
}
