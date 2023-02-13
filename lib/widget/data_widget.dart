import 'package:allegato6/shared_preferences/user_choice.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DataWidget extends StatefulWidget {
  const DataWidget({Key? key}) : super(key: key);

  @override
  State<DataWidget> createState() => _DataWidgetState();
}

class _DataWidgetState extends State<DataWidget> {

  //data e ora aggionrati
  DateTime immersione = DateTime.now();
  DateTime compilazione = DateTime.now();

  @override
  Widget build(BuildContext context) {

    //ora e minuti con 0 a sinistra se hanno una sola cifra
    final oraimmersione = immersione.hour.toString().padLeft(2,"0");
    final minutiimmersione = immersione.minute.toString().padLeft(2,"0");
    final oracompilazione = compilazione.hour.toString().padLeft(2,"0");
    final minuticompilazione = compilazione.minute.toString().padLeft(2,"0");
    final orarioImmersione = "$oraimmersione:$minutiimmersione";
    final orarioCompilazione = "$oracompilazione:$minuticompilazione";
    final giornoImmersione = immersione.day.toString().padLeft(2,"0");
    final meseImmersione = immersione.month.toString().padLeft(2,"0");
    final giornoCompilazione = compilazione.day.toString().padLeft(2,"0");
    final meseCompilazione = compilazione.month.toString().padLeft(2,"0");
    final dataImmersione = "$giornoImmersione/$meseImmersione/${immersione.year}";
    final dataCompilazione = "$giornoCompilazione/$meseCompilazione/${compilazione.year}";

    UserChoiche.setOrarioImmersione(orarioImmersione);
    UserChoiche.setOrarioCompilazione(orarioCompilazione);
    UserChoiche.setDataImmersione(dataImmersione);
    UserChoiche.setDataCompilazione(dataCompilazione);

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
            child: Row(
              children: [
                FaIcon(
                    FontAwesomeIcons.clock,
                  color: Theme.of(context).colorScheme.primary,
                  size: 22,
                ),
                const Text(
                  "  Ora e data immersione: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(UserChoiche.getDataImmersione()+" "+ UserChoiche.getOrarioImmersione()),

              ],
            ),
          ),
          //data e ora immersione
          Wrap(
            alignment: WrapAlignment.start,
            spacing: 10,
            children: [
              //Apre datepicker e imposta data immersione
              ElevatedButton(
                onPressed: () async{
                  final nuovadataimmersione = await pickDate();
                  if(nuovadataimmersione == null) return; //premuto cancel

                  setState(() {
                    immersione = DateTime(nuovadataimmersione.year,nuovadataimmersione.month,nuovadataimmersione.day,immersione.hour,immersione.minute);
                  });
                },
                child: Text("Data")),
              //apre timepicker e imposta ora immersione
              ElevatedButton(
                  onPressed: () async{
                    final nuovaoraimmersione = await pickTime();
                    if(nuovaoraimmersione == null) return; //premuto cancel

                    setState(() {
                      immersione = DateTime(immersione.year,immersione.month,immersione.day,nuovaoraimmersione.hour,nuovaoraimmersione.minute);
                    });
                  },
                  child: Text("Ora")),
              //aggiorna l'orario d'immersione con l'ora attuale
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      immersione = DateTime.now();
                    });
                  },
                  child: Text("Ora attuale")),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.pencil,
                  color: Theme.of(context).colorScheme.primary,
                  size: 22,


                ),
                const Text(
                  "  Ora e data compilazione: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(UserChoiche.getDataCompilazione()+" "+ UserChoiche.getOrarioCompilazione()),

              ],
            ),
          ),
          //data e ora compilazione
          Wrap(
            spacing: 10,
            alignment: WrapAlignment.start,
            children: [
              //Apre datepicker e imposta data compilazione
              ElevatedButton(
                  onPressed: () async{
                    final nuovadatacompilazione = await pickDate();
                    if(nuovadatacompilazione == null) return;

                    setState(() {
                      compilazione = DateTime(nuovadatacompilazione.year,nuovadatacompilazione.month,nuovadatacompilazione.day,compilazione.hour,compilazione.minute);
                    });
                  },
                  child: Text("Data")),
              //apre timepicker e imposta ora compilazione
              ElevatedButton(
                  onPressed: () async{
                    final nuovaoracompilazione = await pickTime();
                    if(nuovaoracompilazione == null) return; //premuto cancel

                    setState(() {
                      compilazione = DateTime(compilazione.year,compilazione.month,compilazione.day,nuovaoracompilazione.hour,nuovaoracompilazione.minute);
                    });
                  },
                  child: Text("Ora")),
              //aggiorna l'orario di compilaizone con l'ora attuale
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      compilazione = DateTime.now();
                    });
                  },
                  child: Text("Ora attuale")),
            ],
          ),
        ],
      ),
    );
  }
  //apre il datepicker
  Future<DateTime?> pickDate() => showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime(2200));
  //apre il timepicker
  Future<TimeOfDay?> pickTime() =>showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
    builder: (context, childWidget){
      return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true), child: childWidget!);
    }

  );
}
