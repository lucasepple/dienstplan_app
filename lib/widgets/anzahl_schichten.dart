import 'package:dienstplan_app/providers/nachtdienste.dart';
import 'package:dienstplan_app/providers/personal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnzahlSchichten extends StatelessWidget {
  final BoxConstraints constraints;
  final Personal personal;
  final int index;

  AnzahlSchichten(this.constraints, this.personal, this.index);

  Widget numberSelector(BuildContext context, double size, [bool max = false]) {
    final int wishValue = personal.schichtenWunsh[index];
    final int maxValue = personal.schichtenMax[index];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(
            Icons.remove,
            size: size * 1.2,
          ),
          onPressed: max
              ? maxValue == 0
                  ? null
                  : () {
                      if (maxValue == wishValue) {
                        Provider.of<Nachtdienste>(context, listen: false)
                            .minusBeide(personal.name, index);
                      } else {
                        Provider.of<Nachtdienste>(context, listen: false)
                            .minusMax(personal.name, index);
                      }
                    }
              : wishValue == 0
                  ? null
                  : () {
                      Provider.of<Nachtdienste>(context, listen: false)
                          .minusWunsch(personal.name, index);
                    },
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size * 0.45),
          child: Text(
            max ? '$maxValue' : '$wishValue',
            style: TextStyle(fontSize: size),
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.add,
            size: size * 1.2,
          ),
          onPressed: () {
            if (max) {
              Provider.of<Nachtdienste>(context, listen: false)
                  .plusMax(personal.name, index);
            } else {
              if (wishValue == maxValue) {
                Provider.of<Nachtdienste>(context, listen: false)
                    .plusBeide(personal.name, index);
              } else {
                Provider.of<Nachtdienste>(context, listen: false)
                    .plusWunsch(personal.name, index);
              }
            }
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
            fontSize: constraints.maxWidth * 0.014,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(constraints.maxHeight * 0.015),
          child: numberSelector(context, constraints.maxWidth * 0.0185),
        ),
        SizedBox(
          height: constraints.maxHeight * 0.018,
        ),
        Text(
          'Maximale Anzahl von Schichten:',
          style: TextStyle(
            fontSize: constraints.maxWidth * 0.014,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(constraints.maxHeight * 0.015),
          child: numberSelector(context, constraints.maxWidth * 0.0185, true),
        ),
      ],
    );
  }
}
