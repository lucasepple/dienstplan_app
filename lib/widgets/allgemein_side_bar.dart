import 'package:dienstplan_app/providers/nachtdienste.dart';
import 'package:dienstplan_app/screens/uebersicht_screen.dart';
import 'package:dienstplan_app/widgets/nachtdienst.dart';
import 'package:dienstplan_app/widgets/personal_hinzufuegen_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllgemeinSideBar extends StatelessWidget {
  final BoxConstraints constraints;

  AllgemeinSideBar(this.constraints);

  List<Widget> personalListe(BuildContext context) {
    List<Widget> liste = [];
    final namen =
        Provider.of<Nachtdienste>(context, listen: false).nachtdienste;

    namen.forEach(
      (element) {
        liste.add(
          Container(
            padding:
                EdgeInsets.symmetric(vertical: constraints.maxHeight * 0.001),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: constraints.maxHeight * 0.008,
                  ),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        Nachtdienst.routeName,
                        arguments: element.name,
                      );
                    },
                    child: SizedBox(
                      height: constraints.maxHeight * 0.05,
                      width: constraints.maxWidth * 0.09,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          element.name,
                          style: TextStyle(
                            // fontSize: constraints.maxWidth * 0.0115,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    size: constraints.maxHeight * 0.024,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        );
      },
    );
    return liste;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: constraints.maxHeight,
        color: Theme.of(context).accentColor,
        padding: EdgeInsets.all(constraints.maxWidth * 0.0175),
        width: constraints.maxWidth * 0.175,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FlatButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    UebersichtScreen.routeName,
                  );
                },
                child: Text(
                  'Übersicht',
                  style: TextStyle(
                    fontSize: constraints.maxWidth * 0.0115,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                height: constraints.maxHeight * 0.001,
                margin: EdgeInsets.symmetric(
                  vertical: constraints.maxHeight * 0.03,
                ),
                color: Theme.of(context).primaryColor,
              ),
              ...personalListe(context),
              SizedBox(height: constraints.maxHeight * 0.02),
              Container(
                alignment: Alignment.center,
                height: constraints.maxHeight * 0.045,
                width: constraints.maxWidth * 0.8,
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(
                      vertical: constraints.maxHeight * 0.01,
                      horizontal: constraints.maxWidth * 0.02),
                  child: Text('+ hinzufügen'),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.grey[200],
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return PersonalHinzufuegenDialog();
                      },
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(constraints.maxHeight * 0.0275),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
