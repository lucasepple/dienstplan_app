import 'package:flutter/material.dart';

class NumberSelector extends StatefulWidget {
  @override
  _NumberSelectorState createState() => _NumberSelectorState();
}

class _NumberSelectorState extends State<NumberSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: null,
        ),
        Text('0'),
        IconButton(
          icon: Icon(
            Icons.add,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
