import 'package:allegato6/shared_preferences/user_choice.dart';
import 'package:allegato6/shared_preferences/user_settings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BarcaWidget extends StatefulWidget {

  @override
  _BarcaWidgetState createState() => _BarcaWidgetState();
}

class _BarcaWidgetState extends State<BarcaWidget> {

  List<String> barche = [];

  @override
  void initState() {
    super.initState();
    UserChoiche.setSceltoBarca(UserChoiche.getSceltoBarca()??"");
  }

  final textController = TextEditingController();
  String ?nuovaBarca;
  int? _value;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
            child: Row(
              children: [
              FaIcon(
                FontAwesomeIcons.ship,
                color: Theme.of(context).colorScheme.primary,
                size: 22,

              ),
              const Text(
                  "  Barca",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Wrap(
            spacing: 8,
            children: crea(),
          )
        ],
      ),
    );
  }


  List<StatelessWidget> crea() {
    barche = UserSettings.getBarche()??[];
    List<ChoiceChip> listaC = [];
    for (int i = 0; i < barche.length; i++) {
      listaC.add(ChoiceChip(
        label: Text(barche[i]),
        onSelected: (bool selected) {
          setState(() {
            _value=i;
            UserChoiche.setSceltoBarca(barche[i]);

          });
        },selected: _value == i,
        backgroundColor: Theme.of(context).colorScheme.background,
        selectedColor: Theme.of(context).colorScheme.secondaryContainer,
        shape: StadiumBorder(
            side: BorderSide(
              width: 1,
              color: Theme.of(context).colorScheme.secondary,
            )
        ),
        labelStyle: TextStyle(
          color: _value==i ? Theme.of(context).colorScheme.onSecondaryContainer
              : Theme.of(context).colorScheme.secondary,

        ),
      ));
    }
    if(listaC.isEmpty){
      List<Text> vuoto = [];
      vuoto.add(Text("Aggiungi i nomi delle barche nelle impostazioni"));
      return vuoto;
    }
    return listaC;
  }

}
