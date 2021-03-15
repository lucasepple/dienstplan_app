import 'package:dienstplan_app/providers/nachtdienste.dart';
import 'package:dienstplan_app/providers/personal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonalHinzufuegenDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: LayoutBuilder(
        builder: (context, constraints) => Container(
          height: constraints.maxHeight * 0.7,
          width: constraints.maxWidth * 0.6,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(constraints.maxWidth * 0.02),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth * 0.01,
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Abbrechen'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth * 0.01,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Provider.of<Nachtdienste>(context, listen: false)
                          .addPersonal(
                            Personal(
                              name: 'Test',
                              schichten: 2,
                            ),
                          )
                          .then((value) => Navigator.of(context).pop());
                    },
                    child: Text('Hinzufügen'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
