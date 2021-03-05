import 'package:dienstplan_app/helpers/monate.dart';
import 'package:dienstplan_app/widgets/number_selector.dart';
import 'package:flutter/material.dart';

class Nachtdienst extends StatefulWidget {
  static const String routeName = '/nachtdienst';
  final String name;
  final int currentMonth = 2;
  int selectedMonth = 2;

  Nachtdienst(this.name);

  @override
  _NachtdienstState createState() => _NachtdienstState();
}

class _NachtdienstState extends State<Nachtdienst> {
  List<Widget> _monthList(BuildContext context, BoxConstraints constraints) {
    List<Widget> list = [];
    for (int i = widget.currentMonth; i < widget.currentMonth + 4; i++) {
      list.add(
        Container(
          // margin: EdgeInsets.symmetric(
          //   horizontal: constraints.maxWidth * 0.0035,
          // ),
          height: constraints.maxHeight * 0.055,
          width: constraints.maxWidth * 0.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(constraints.maxHeight * 0.0275),
            color: i == widget.selectedMonth
                ? Theme.of(context).primaryColor
                : null,
          ),
          child: TextButton(
            child: Text(
              Monate.monateListe[i],
              style: TextStyle(
                  color: i == widget.selectedMonth
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                  fontSize: constraints.maxWidth * 0.013),
            ),
            onPressed: () {
              setState(() {
                widget.selectedMonth = i;
              });
            },
          ),
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        padding: EdgeInsets.symmetric(
          horizontal: constraints.maxWidth * 0.06,
          vertical: constraints.maxHeight * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.name,
              style: TextStyle(
                fontSize: constraints.maxWidth * 0.0225,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.04,
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _monthList(context, constraints),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.04,
            ),
            Text('Gewünschte Anzahl von Schichten:'),
            NumberSelector(),
            Text('Maximale Anzahl von Schichten:'),
            NumberSelector(),
            Text('Verfügbare Daten:'),
          ],
        ),
      ),
    );
  }
}
