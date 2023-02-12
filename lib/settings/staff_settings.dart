import 'package:allegato6/shared_preferences/user_settings.dart';
import 'package:flutter/material.dart';

import '../theme.dart';
class StaffSettings extends StatefulWidget {
  const StaffSettings({Key? key}) : super(key: key);

  @override
  _StaffSettingsState createState() => _StaffSettingsState();
}

class _StaffSettingsState extends State<StaffSettings> {

  List<String> staff = [] ;

  @override
  void initState(){
    super.initState();
    staff = UserSettings.getStaff()??[];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Modifica Staff"),
          backgroundColor: MyThemes.lightTheme.colorScheme.primary,
          foregroundColor: MyThemes.lightTheme.colorScheme.onPrimary),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 30.0, 8.0, 30.0),
              child: Wrap(
                  spacing: 8.0,
                  children: crea()
              ),
            ),
          ),
          aggiungi(),
        ],
      ),
    );
  }

  final textController = TextEditingController();
  String ?nuovoStaff;

  List<InputChip> crea() {
    List<InputChip> listaC = [];
    for (int i = 0; i < staff.length; i++) {
      listaC.add(InputChip(
        label: Text(staff[i]),
        onDeleted: () async{
          setState(() {
            staff.removeAt(i);
          });
          await UserSettings.setStaff(staff);
        },backgroundColor: Theme.of(context).colorScheme.background,
        selectedColor: Theme.of(context).colorScheme.secondaryContainer,
        shape: StadiumBorder(
            side: BorderSide(
              width: 1,
              color: Theme.of(context).colorScheme.secondary,
            )
        ),
        labelStyle: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ));
    }
    return listaC;
  }

  ElevatedButton aggiungi() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: MyThemes.lightTheme.colorScheme.primary,
          foregroundColor: MyThemes.lightTheme.colorScheme.onPrimary
      ),
      onPressed: () async{
        await showAlertDialog(context);
        setState(() {
          if(nuovoStaff!="") {
            staff.add(nuovoStaff!);
          }
        });
        await UserSettings.setStaff(staff);
      },
      child: Text("Aggiungi Staff"),
    );
  }


  Future showAlertDialog(BuildContext context) => showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Inserisci Staff"),
          content:buildText() ,
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
                TextButton(onPressed:(){
                  nuovoStaff="";
                  textController.clear();
                  Navigator.of(context).pop();
                }, child: Text("Annulla")),
                TextButton(
                    onPressed: () {
                      nuovoStaff=textController.text;
                      textController.clear();
                      Navigator.of(context).pop();
                    }, child: Text("Inserisci")),
              ],
            )
          ],
        );
      }
  );


  Widget buildText() => TextField(

    controller: textController,
    decoration: InputDecoration(
      labelText: 'Staff',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    textInputAction: TextInputAction.done,
  );

}
