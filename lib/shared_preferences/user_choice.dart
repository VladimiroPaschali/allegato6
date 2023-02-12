import 'package:shared_preferences/shared_preferences.dart';

class UserChoiche{

  static late SharedPreferences _preferences2;

  static Future init() async {
    _preferences2 = await SharedPreferences.getInstance();
    //_preferences2.clear(); //rimuove valori salvati debug

    reset();

  }

  static reset() async {
    await _preferences2.setString("sceltoLuogo", "");
    await _preferences2.setString("sceltoPartecipanti", "");
    await _preferences2.setString("sceltoStaff", "");
    await _preferences2.setString("sceltoBarca", "");
    await _preferences2.setString("orarioImmersione", "");
    await _preferences2.setString("orarioCompilazione", "");

  }

  static setSceltoLuogo(String sceltoLuogo) async =>
      await _preferences2.setString("sceltoLuogo", sceltoLuogo);

  static getSceltoLuogo() =>
      _preferences2.getString("sceltoLuogo");

  static setSceltoPartecipanti(String sceltoPartecipanti) async =>
      await _preferences2.setString("sceltoPartecipanti", sceltoPartecipanti);

  static getSceltoPartecipanti() =>
      _preferences2.getString("sceltoPartecipanti");

  static setSceltoStaff(String sceltoStaff) async =>
      await _preferences2.setString("sceltoStaff", sceltoStaff);

  static getSceltoStaff() =>
      _preferences2.getString("sceltoStaff");

  static setSceltoBarca(String sceltoBarca) async =>
      await _preferences2.setString("sceltoBarca", sceltoBarca);

  static getSceltoBarca() =>
      _preferences2.getString("sceltoBarca");

  static setOrarioImmersione(String orarioImmersione) async =>
      await _preferences2.setString("orarioImmersione", orarioImmersione);

  static getOrarioImmersione() =>
      _preferences2.getString("orarioImmersione");

  static setOrarioCompilazione(String orarioCompilazione) async =>
      await _preferences2.setString("orarioCompilazione", orarioCompilazione);

  static getOrarioCompilazione() =>
      _preferences2.getString("orarioCompilazione");

  static setDataImmersione(String dataImmersione) async =>
      await _preferences2.setString("dataImmersione", dataImmersione);

  static getDataImmersione() =>
      _preferences2.getString("dataImmersione");

  static setDataCompilazione(String dataCompilazione) async =>
      await _preferences2.setString("dataCompilazione", dataCompilazione);

  static getDataCompilazione() =>
      _preferences2.getString("dataCompilazione");

  /*static setErrori(List<String> listaErrori) async {
      await _preferences2.setStringList("listaErrori", listaErrori);
  }
  static getErrori(){
    _preferences2.getStringList("listaErrori");
  }*/

}