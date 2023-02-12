import 'package:shared_preferences/shared_preferences.dart';
//Usa shared preferences per salvare i dati delle impostazioni
class UserSettings{
  static late SharedPreferences _preferences;

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
    //_preferences.clear(); //rimuove valori salvati debug
  }

  static setSocieta(String societa ) async =>
      await _preferences.setString("societa", societa);

  static getSocieta() =>
      _preferences.getString("societa");
  static setLuoghi(List<String> luoghi) async =>
      await _preferences.setStringList("luoghi", luoghi);

  static getLuoghi() =>
      _preferences.getStringList("luoghi");

  static setPartecipanti(String partecipanti) async =>
      await _preferences.setString("partecipanti", partecipanti);

  static getPartecipanti() =>
      _preferences.getString("partecipanti");

  static setStaff(List<String> staff) async =>
      await _preferences.setStringList("staff", staff);

  static getStaff() =>
      _preferences.getStringList("staff");

  static setBarche(List<String> barche) async =>
      await _preferences.setStringList("barche", barche);

  static getBarche() =>
      _preferences.getStringList("barche");



}