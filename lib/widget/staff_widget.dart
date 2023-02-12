import 'package:allegato6/shared_preferences/user_settings.dart';
import 'package:flutter/material.dart';
import '../shared_preferences/user_choice.dart';

class StaffWidget extends StatefulWidget {
  const StaffWidget({super.key});


  @override
  StaffWidgetState createState() => StaffWidgetState();
}

class StaffWidgetState extends State<StaffWidget> {

  List<String> staff = [];

  List<bool> _isSelected = [];



  @override
  void initState() {
    super.initState();
    UserChoiche.setSceltoStaff(UserChoiche.getSceltoStaff()??"");
    _isSelected = List.generate(staff.length, (_) => false);

  }

  final textController = TextEditingController();
  String _staff="Inserisci Staff";
  List _staffL=[];
  String ?nuovoNome;
  String stampa="";


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
              Icon(
                Icons.handyman,
                color: Theme.of(context).colorScheme.primary,
                size: 26,

              ),
              const Text("  Staff" ,
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

  List<StatelessWidget> crea(){

    staff = UserSettings.getStaff()??[];
    int nuovi = staff.length-_isSelected.length;
    for(int i=0; i<nuovi;i++){
      _isSelected.add(false);
    }
    List<FilterChip> listaC = [];
    for (int i = 0; i < staff.length; i++){
      listaC.add(FilterChip(
          label: Text(staff[i]),
          selected: _isSelected[i],
          onSelected: (bool selected){
            setState(() {
              _isSelected[i]=selected;
              if(_staffL.contains(staff[i])){
                _staffL.remove(staff[i]);
              }else{
                _staffL.add(staff[i]);
              }
              _staff=_staffL.join(" - ");
              UserChoiche.setSceltoStaff(_staff);
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
            color: _isSelected[i] ? Theme.of(context).colorScheme.onSecondaryContainer
              : Theme.of(context).colorScheme.secondary,
          ),
      ));
    }
    if(listaC.isEmpty){
      List<Text> vuoto = [];
      vuoto.add(Text("Aggiungi i membri dello staff nelle impostazioni"));
      return vuoto;
    }
    return listaC;
  }

}
