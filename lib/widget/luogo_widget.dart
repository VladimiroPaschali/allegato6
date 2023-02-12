import 'package:allegato6/shared_preferences/user_choice.dart';
import 'package:allegato6/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../shared_preferences/user_settings.dart';


class LuogoWidget extends StatefulWidget {
  const LuogoWidget({Key? key}) : super(key: key);
  @override
  LuogoWidgetState createState() => LuogoWidgetState();

}


class LuogoWidgetState extends State<LuogoWidget> {

  List<String> luoghi = [] ;

  @override
  void initState() {
    super.initState();
    UserChoiche.setSceltoLuogo(UserChoiche.getSceltoLuogo()??"");
  }

  final textController = TextEditingController();
  String ?nuovoLuogo;
  int? _value;

  @override
  Widget build(BuildContext context) =>Padding(
    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
          child: Row(
            children: [
              FaIcon(
                FontAwesomeIcons.locationDot,
                color: MyThemes.lightTheme.colorScheme.primary,
                size: 22,
              ),
              const Text(
                "  Luogo Immersione",
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


  List<StatelessWidget> crea()  {
    luoghi = UserSettings.getLuoghi()??[];
    List<ChoiceChip> listaC = [];
    for (int i = 0; i < luoghi.length; i++) {
      listaC.add(ChoiceChip(
        label: Text(luoghi[i]),
        onSelected: (bool selected) {
          setState(() {
            //uno è sempre selezionato
            _value=i;
            UserChoiche.setSceltoLuogo(luoghi[i]);
          });
        }, selected: _value == i,
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
          ),
      ));
    }
    if(listaC.isEmpty){
      List<Text> vuoto = [];
      vuoto.add(Text("Aggiungi i luoghi d'immersione nelle impostazioni"));
      return vuoto;
    }
    return listaC;
  }

  Widget form(){
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Wrap(
        spacing: 8,
        children: crea(),
      ),
    );

  }

}