import 'package:flutter/material.dart';

class AnzahlSchichten extends StatefulWidget {
  final BoxConstraints constraints;

  AnzahlSchichten(this.constraints);

  @override
  _AnzahlSchichtenState createState() => _AnzahlSchichtenState();
}

class _AnzahlSchichtenState extends State<AnzahlSchichten> {
  int _wishValue = 0;
  int _maxValue = 0;

  Widget _numberSelector(double size, [bool max = false]) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(
            Icons.remove,
            size: size * 1.2,
          ),
          onPressed: max
              ? _maxValue == 0
                  ? null
                  : () {
                      setState(() {
                        if (_maxValue == _wishValue) {
                          _maxValue--;
                          _wishValue--;
                        } else {
                          _maxValue--;
                        }
                      });
                    }
              : _wishValue == 0
                  ? null
                  : () {
                      setState(() {
                        _wishValue--;
                      });
                    },
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size * 0.45),
          child: Text(
            max ? '$_maxValue' : '$_wishValue',
            style: TextStyle(fontSize: size),
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.add,
            size: size * 1.2,
          ),
          onPressed: () {
            setState(
              () {
                if (max) {
                  _maxValue++;
                } else {
                  if (_wishValue == _maxValue) {
                    _wishValue++;
                    _maxValue++;
                  } else {
                    _wishValue++;
                  }
                }
              },
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Gewünschte Anzahl von Schichten:',
          style: TextStyle(
            fontSize: widget.constraints.maxWidth * 0.014,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(widget.constraints.maxHeight * 0.015),
          child: _numberSelector(widget.constraints.maxWidth * 0.0185),
        ),
        SizedBox(
          height: widget.constraints.maxHeight * 0.018,
        ),
        Text(
          'Maximale Anzahl von Schichten:',
          style: TextStyle(
            fontSize: widget.constraints.maxWidth * 0.014,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(widget.constraints.maxHeight * 0.015),
          child: _numberSelector(widget.constraints.maxWidth * 0.0185, true),
        ),
      ],
    );
  }
}
