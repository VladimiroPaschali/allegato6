import 'package:allegato6/shared_preferences/user_settings.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class BarcaSettings extends StatefulWidget {
  const BarcaSettings({Key? key}) : super(key: key);

  @override
  _BarcaSettingsState createState() => _BarcaSettingsState();
}

class _BarcaSettingsState extends State<BarcaSettings> {
  List<String> barche = [] ;

  @override
  void initState(){
    super.initState();
    barche = UserSettings.getBarche()??[];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Modifica Barche"),
          backgroundColor: MyThemes.lightTheme.colorScheme.primary,
          foregroundColor: MyThemes.lightTheme.colorScheme.onPrimary
      ),
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
  String ?nuovaBarca;

  List<InputChip> crea() {
    List<InputChip> listaC = [];
    for (int i = 0; i < barche.length; i++) {
      listaC.add(InputChip(
        label: Text(barche[i]),
        onDeleted: () async {
          setState(() {
            barche.removeAt(i);
          });
          await UserSettings.setBarche(barche);
        },
        backgroundColor: Theme.of(context).colorScheme.background,
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
          if(nuovaBarca!="") {
            barche.add(nuovaBarca!);
          }
        });
        await UserSettings.setBarche(barche);
      },
      child: Text("Aggiungi Barca"),
    );
  }


  Future showAlertDialog(BuildContext context) => showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Inserisci Barca"),
          content:buildText() ,
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
                TextButton(onPressed:(){
                  nuovaBarca="";
                  textController.clear();
                  Navigator.of(context).pop();
                }, child: Text("Annulla")),
                TextButton(
                    onPressed: () {
                      nuovaBarca=textController.text;
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
      labelText: 'Barca',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),

    ),
    textInputAction: TextInputAction.done,
  );


}
