import 'package:allegato6/shared_preferences/user_choice.dart';
import 'package:allegato6/shared_preferences/user_settings.dart';
import 'package:allegato6/settings/settings_page.dart';
import 'package:allegato6/theme.dart';
import 'package:allegato6/widget/barca_widget.dart';
import 'package:allegato6/widget/bottone_pdf.dart';
import 'package:allegato6/widget/data_widget.dart';
import 'package:allegato6/widget/luogo_widget.dart';
import 'package:allegato6/widget/partecipanti_widget.dart';
import 'package:allegato6/widget/staff_widget.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  //si assicura che shared preferences sia inizializzato
  WidgetsFlutterBinding.ensureInitialized();
  //inizializza shared preferences in user_settings
  await UserSettings.init();
  await UserChoiche.init();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Allegato 6',
      theme: MyThemes.lightTheme,
      home: const MyHomePage(title: 'Allegato 6'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          //tre punti menu in alto a destra
          PopupMenuButton(
              onSelected: (item) => onSelectedPopupMenu(context, item),
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                  //si clicca su impostazioni valore 0
                  value: 0,
                  child: Row(
                    children: const [
                      Icon(Icons.settings, color: Colors.black),
                      SizedBox(width: 8),
                      Text("Impostazioni"),
                    ],
                  )),
              ])
        ],
        backgroundColor: MyThemes.lightTheme.colorScheme.primary,
        foregroundColor: MyThemes.lightTheme.colorScheme.onPrimary
      ),
      body:ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          DataWidget(),
          LuogoWidget(),
          PartecipantiWidget(),
          StaffWidget(),
          BarcaWidget(),
          BottonePDF(),
        ],
      ),
    );
  }
  //chiamato quando si clicca su un elemento nel menu in alto a destra della home
  onSelectedPopupMenu(BuildContext context, int item) {
    switch (item) {
    //impostazioni valore 0
      case 0:
        Navigator.of(context)
            .push(
          MaterialPageRoute(builder: (context) => SettingsPage()),
        )
            .then((value) {
          setState(() {});
          //saveSettings();
        });
        break;
    }
  }

}
