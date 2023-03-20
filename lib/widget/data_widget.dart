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
    //inizializza immersione e compilazione
    salva(immersione,true);
    salva(compilazione,false);

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
                  " Ora e data immersione: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  UserChoiche.getDataImmersione()+" "+ UserChoiche.getOrarioImmersione(),
                  style: const TextStyle(
                    fontSize: 14,
                    letterSpacing: -0.2,
                    wordSpacing: -0.2,
                  ),
                ),
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
                  //imposta data immersione
                  setState(() {
                    immersione = DateTime(nuovadataimmersione.year,nuovadataimmersione.month,nuovadataimmersione.day,immersione.hour,immersione.minute);
                    salva(immersione, true);
                  });
                },
                child: Text("Data")),
              //apre timepicker e imposta ora immersione
              ElevatedButton(
                  onPressed: () async{
                    final nuovaoraimmersione = await pickTime();
                    if(nuovaoraimmersione == null) return; //premuto cancel
                    //Imposta ora immersione
                    setState(() {
                      immersione = DateTime(immersione.year,immersione.month,immersione.day,nuovaoraimmersione.hour,nuovaoraimmersione.minute);
                      salva(immersione, true);
                    });
                  },
                  child: Text("Ora")),
              //aggiorna l'orario d'immersione con l'ora attuale
              ElevatedButton(
                  onPressed: () {
                    //aggiorna oradata attuali immersione
                    setState(() {
                      immersione = DateTime.now();
                      salva(immersione, true);
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
                  " Ora e data compilazione: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  UserChoiche.getDataCompilazione()+" "+ UserChoiche.getOrarioCompilazione(),
                  style: const TextStyle(
                    fontSize: 14,
                    letterSpacing: -0.2,
                    wordSpacing: -0.2,
                  ),
                ),
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
                    //imposta data compilazione
                    setState(() {
                      compilazione = DateTime(nuovadatacompilazione.year,nuovadatacompilazione.month,nuovadatacompilazione.day,compilazione.hour,compilazione.minute);
                      salva(compilazione, false);
                    });
                  },
                  child: Text("Data")),
              //apre timepicker e imposta ora compilazione
              ElevatedButton(
                  onPressed: () async{
                    final nuovaoracompilazione = await pickTime();
                    if(nuovaoracompilazione == null) return; //premuto cancel
                    //Imposta ora compilazione
                    setState(() {
                      compilazione = DateTime(compilazione.year,compilazione.month,compilazione.day,nuovaoracompilazione.hour,nuovaoracompilazione.minute);
                      salva(compilazione, false);
                    });
                  },
                  child: Text("Ora")),
              //aggiorna l'orario di compilaizone con l'ora attuale
              ElevatedButton(
                  onPressed: () {
                    //aggiorna oradata compilazione
                    setState(() {
                      compilazione = DateTime.now();
                      salva(compilazione, false);
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

  //salva le stringhe ora e data nelle sharedpreferences
  void salva(DateTime dataOra,bool immersione){
    var ora = dataOra.hour.toString().padLeft(2,"0");
    var minuti = dataOra.minute.toString().padLeft(2,"0");
    var orario = "$ora:$minuti";
    var giorno = dataOra.day.toString().padLeft(2,"0");
    var mese = dataOra.month.toString().padLeft(2,"0");
    var data = "$giorno/$mese/${dataOra.year}";
    if(immersione){
      UserChoiche.setOrarioImmersione(orario);
      UserChoiche.setDataImmersione(data);
    }else{
      UserChoiche.setOrarioCompilazione(orario);
      UserChoiche.setDataCompilazione(data);
    }
    //print(orario);
    //print(UserChoiche.getOrarioImmersione());
  }

}
