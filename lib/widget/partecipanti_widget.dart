import 'package:allegato6/shared_preferences/user_settings.dart';
import 'package:flutter/material.dart';
import '../shared_preferences/user_choice.dart';

class PartecipantiWidget extends StatefulWidget {
  const PartecipantiWidget({super.key});


  @override
  PartecipantiWidgetState createState() => PartecipantiWidgetState();
}

class PartecipantiWidgetState extends State<PartecipantiWidget> {

  String partecipanti = "";

  @override
  void initState() {
    super.initState();
    UserChoiche.setSceltoPartecipanti(UserChoiche.getSceltoPartecipanti()??"");
  }

  int? _value;


  @override
  Widget build(BuildContext context) =>
      Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
              child: Row(
                children: [
                  Icon(
                    Icons.people,
                    color: Theme.of(context).colorScheme.primary,
                    size: 26,
                  ),
                  const Text(" Numero Partecipanti",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Wrap(
              spacing: 4,
              children: crea(),
            )
          ],
        ),
      );

  List<StatelessWidget> crea(){
    partecipanti = UserSettings.getPartecipanti()??"0";
    int max =int.parse(partecipanti);

    List<ChoiceChip> listaC =[];
    for(int i=0; i<max; i++){
      listaC.add(ChoiceChip(
        label: Text((i+1).toString()),
        selected: _value ==i,
        onSelected: (bool selected){
          setState(() {
            UserChoiche.setSceltoPartecipanti((i+1).toString());
            _value=i;
          });
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
            color: _value==i ? Theme.of(context).colorScheme.onSecondaryContainer : Theme.of(context).colorScheme.secondary,
          )
      ));
    }
    if(listaC.isEmpty){
      List<Text> vuoto = [];
      vuoto.add(const Text("Imposta il numero di partecipanti nelle impostazioni"));
      return vuoto;
    }
    return listaC;
  }

}