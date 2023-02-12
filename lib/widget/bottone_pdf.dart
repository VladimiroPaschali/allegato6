import 'package:allegato6/htmlconverter.dart';
import 'package:allegato6/shared_preferences/user_choice.dart';
import 'package:allegato6/shared_preferences/user_settings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_file/open_file.dart';
import '../theme.dart';

class BottonePDF extends StatefulWidget {
  const BottonePDF({Key? key}) : super(key: key);

  @override
  State<BottonePDF> createState() => _BottonePDFState();
}

class _BottonePDFState extends State<BottonePDF> {


  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const FaIcon(FontAwesomeIcons.file),
      label:const Text("Genera PDF"),
      onPressed: () async {
        List<String> mancanti = valida();
        if (mancanti.isEmpty) {
          pdf();
        }
        else{
          errore(mancanti);
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: MyThemes.lightTheme.colorScheme.primary,
        foregroundColor: MyThemes.lightTheme.colorScheme.onPrimary
      ),
    );

  }
  //controlla campi mancanti
  List<String> valida() {
    List<String> mancanti = [];

    if (UserSettings.getSocieta() == ""){
      mancanti.add("Società");
    }

    if (UserChoiche.getSceltoLuogo() == ""){
      mancanti.add("Luogo");
    }
    if (UserChoiche.getSceltoPartecipanti() == ""){
      mancanti.add("Partecipanti");
    }
    if (UserChoiche.getSceltoStaff() == ""){
      mancanti.add("Staff");
    }
    if (UserChoiche.getSceltoBarca() == ""){
      mancanti.add("Barca");
    }

    return mancanti;
  }
  //crea pdf
  void pdf() async {

    final pdfFile = await HtmlConverter.generate(
        UserSettings.getSocieta(),
        UserChoiche.getOrarioImmersione(),
        UserChoiche.getDataImmersione(),
        UserChoiche.getSceltoLuogo(),
        UserChoiche.getSceltoPartecipanti(),
        UserChoiche.getSceltoStaff(),
        UserChoiche.getSceltoBarca(),
        UserChoiche.getDataCompilazione(),
        UserChoiche.getOrarioCompilazione()
    );
    await OpenFile.open(pdfFile.path);

  }

  //apre snackbar se non vengono selezionati tutti i campi
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> errore(List<String> mancanti) {
    String errore = "";
    String societa ="";
    if(mancanti[0] == "Società"){
      societa = "Imposta la Società nelle impostazioni";
      mancanti.removeAt(0);
    }
    if(mancanti.isNotEmpty) {
      errore = "Seleziona ";
      errore += mancanti[0];

      for (int i = 1; i < mancanti.length; i++) {
        if (i == mancanti.length - 1) {
          errore += " e ${mancanti[i]}";
        }
        else {
          errore += ", ${mancanti[i]}";
        }
      }
    }
    //imposta testo snackbar
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: MyThemes.lightScheme.error,
        showCloseIcon: true,
        content: Wrap(
          spacing: 10,
          children: [
            Text(
              societa,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              errore,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
