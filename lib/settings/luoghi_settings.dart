import 'package:allegato6/shared_preferences/user_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class LuoghiSettings extends StatefulWidget {
  const LuoghiSettings({Key? key}) : super(key: key);

  @override
  State<LuoghiSettings> createState() => _LuoghiSettingsState();
}

class _LuoghiSettingsState extends State<LuoghiSettings> {

  List<String> luoghi = [] ;

  @override
  void initState(){
    super.initState();
    luoghi = UserSettings.getLuoghi()??[];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Aggiungi luogo d'immersione"),
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
  //List<bool> _isSelected = List.generate(lista.length, (_) => false);
  int? _value;
  final textController = TextEditingController();
  String ?nuovoLuogo;




  List<InputChip> crea() {
    List<InputChip> listaC = [];
    for (int i = 0; i < luoghi.length; i++) {
      listaC.add(InputChip(
        label: Text(luoghi[i]),
        //elimina chip
        onDeleted: () async {
          setState(() {
            luoghi.removeAt(i);
          });
          await UserSettings.setLuoghi(luoghi);
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
          if(nuovoLuogo!="") {
            luoghi.add(nuovoLuogo!);
          }
        });
        await UserSettings.setLuoghi(luoghi);
      },
      child: Text("Aggiungi Luogo"),
    );
  }


  Future showAlertDialog(BuildContext context) => showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Inserisci Luogo"),
          content:buildText() ,
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
                TextButton(onPressed:(){
                  nuovoLuogo="";
                  textController.clear();
                  Navigator.of(context).pop();
                }, child: Text("Annulla")),
                TextButton(
                    onPressed: () {
                      nuovoLuogo=textController.text;
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
    decoration:  InputDecoration(
      labelText: 'Luogo',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    textInputAction: TextInputAction.done,
  );


}
