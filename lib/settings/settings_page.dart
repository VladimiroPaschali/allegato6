import 'package:allegato6/shared_preferences/user_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:settings_ui/settings_ui.dart';

import '../theme.dart';
import 'barca_settings.dart';
import 'luoghi_settings.dart';
import 'staff_settings.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  final textControllerpartecipanti = TextEditingController();
  final textControllerSocieta = TextEditingController();

  String societa = "";
  List<String> luoghi = [] ;
  String partecipanti = "a";

  @override
  void initState(){
    super.initState();

    societa = UserSettings.getSocieta()?? "";
    luoghi = UserSettings.getLuoghi()??[];
    partecipanti = UserSettings.getPartecipanti() ?? "a";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Impostazioni"),
          backgroundColor: MyThemes.lightTheme.colorScheme.primary,
          foregroundColor: MyThemes.lightTheme.colorScheme.onPrimary

      ),
      body: SettingsList(
        sections: [
          SettingsSection(
              tiles: <SettingsTile>[
                buildSocieta(),
                buildLuoghi(),
                buildPartecipanti(),
                buildStaff(),
                buildBarca(),


              ])
        ],
      ),
    );
  }

  SettingsTile buildSocieta() {
    return SettingsTile.navigation(
        title: Text("Nome Società"),
        description: Text(UserSettings.getSocieta()??""),
        trailing: Icon(Icons.keyboard_arrow_right),
        onPressed: (context) {
          showAlertDialogSocieta(context);
        }
    );
  }

  Future showAlertDialogSocieta(BuildContext context) =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Inserisci Società"),
              content: buildTextSocieta(),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(onPressed: () {
                      textControllerSocieta.clear();
                      Navigator.of(context).pop();
                    }, child: Text("Annulla")),
                    TextButton(
                        onPressed: () async {
                            await UserSettings.setSocieta(textControllerSocieta.text);
                          setState(() {
                            //aggiorna lo stato per visualizzare in nuovo valore inserito
                          });
                          textControllerSocieta.clear();
                          Navigator.of(context).pop();
                        }, child: Text("Inserisci")),
                  ],
                )
              ],
            );
          }
      );

  Widget buildTextSocieta() =>
      TextField(
        controller: textControllerSocieta,
        decoration:  InputDecoration(
          labelText: 'Nome Società',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        textInputAction: TextInputAction.done,
      );

  SettingsTile buildLuoghi() {
    return SettingsTile.navigation(
        title: Text("Luoghi d'immersione"),
        description: Text(stampaLista(UserSettings.getLuoghi()??[])),
        trailing: Icon(Icons.keyboard_arrow_right),
        onPressed: (context) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => LuoghiSettings(),
          )).then((value) {
            setState(() {});
          });
        }
    );
  }

  String stampaLista(List<String> lista) {
    if (lista.isEmpty) {
      return "";
    } else {
      String s = "";
      for (int i = 0; i < lista.length - 1; i++) {
        s = s + lista[i] + " - ";
      }
      s = s + lista.last;

      return s;
    }
  }

  SettingsTile buildPartecipanti() {
    return SettingsTile.navigation(
        title: Text("Numero Massimo Partecipanti"),
        description: Text(UserSettings.getPartecipanti()??""),
        trailing: Icon(Icons.keyboard_arrow_right),
        onPressed: (context) {
          showAlertDialogPartecipanti(context);
        }
    );
  }

  Future showAlertDialogPartecipanti(BuildContext context) =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Inserisci Partecipanti"),
              content: buildTextPartecipanti(),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(onPressed: () {
                      textControllerpartecipanti.clear();
                      Navigator.of(context).pop();
                    }, child: Text("Annulla")),
                    TextButton(
                        onPressed: () {
                          UserSettings.setPartecipanti(textControllerpartecipanti.text);
                          setState(() {
                            //aggiorna lo stato per visualizzare in nuovo valore inserito
                          });
                          textControllerpartecipanti.clear();
                          Navigator.of(context).pop();
                        }, child: Text("Inserisci")),
                  ],
                )
              ],
            );
          }
      );

  Widget buildTextPartecipanti() =>
      TextField(
        controller: textControllerpartecipanti,
        decoration:  InputDecoration(
          labelText: 'Numero massimo Partecipanti',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly],
      );

  SettingsTile buildStaff() {
    return SettingsTile.navigation(
        title: Text("Membri Staff"),
        description: Text(stampaLista(UserSettings.getStaff()??[])),
        trailing: Icon(Icons.keyboard_arrow_right),
        onPressed: (context) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => StaffSettings(),
          )).then((value) {
            setState(() {});
          });
        }
    );
  }

  SettingsTile buildBarca() {
    return SettingsTile.navigation(
        title: Text("Barche"),
        description: Text(stampaLista(UserSettings.getBarche()??[])),
        trailing: Icon(Icons.keyboard_arrow_right),
        onPressed: (context) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BarcaSettings(),
          )).then((value) {
            setState(() {});
          });
        }
    );
  }

}