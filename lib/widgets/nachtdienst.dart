import 'package:dienstplan_app/helpers/monate.dart';
import 'package:dienstplan_app/providers/nachtdienste.dart';
import 'package:dienstplan_app/providers/personal.dart';
import 'package:dienstplan_app/widgets/anzahl_schichten.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Nachtdienst extends StatefulWidget {
  static const String routeName = '/nachtdienst';
  // final String name = 'Nachtdienst';
  final int currentMonth = 2;
  int selectedMonth = 2;

  @override
  _NachtdienstState createState() => _NachtdienstState();
}

class _NachtdienstState extends State<Nachtdienst> {
  List<Widget> _monthList(BuildContext context, BoxConstraints constraints) {
    List<Widget> list = [];
    for (int i = widget.currentMonth; i < widget.currentMonth + 3; i++) {
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
    final String name = ModalRoute.of(context).settings.arguments;
    final personal = Provider.of<Nachtdienste>(context).findByName(name);
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
              personal.name,
              style: TextStyle(
                fontSize: constraints.maxWidth * 0.019,
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
              height: constraints.maxHeight * 0.085,
            ),
            Column(
              children: [
                AnzahlSchichten(
                  constraints,
                  personal,
                  widget.selectedMonth - widget.currentMonth,
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.018,
                ),
                Text(
                  'Mögliche Daten:',
                  style: TextStyle(fontSize: constraints.maxWidth * 0.014),
                ),
                Padding(
                  padding: EdgeInsets.all(constraints.maxHeight * 0.015),
                  child: Container(
                    alignment: Alignment.center,
                    height: constraints.maxHeight * 0.05,
                    width: constraints.maxWidth * 0.9,
                    child: RaisedButton(
                      padding: EdgeInsets.symmetric(
                          vertical: constraints.maxHeight * 0.015,
                          horizontal: constraints.maxWidth * 0.025),
                      child: Text('+ hinzufügen'),
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.grey[200],
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            constraints.maxHeight * 0.025),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
