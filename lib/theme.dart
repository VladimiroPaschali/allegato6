import 'package:flutter/material.dart';

class MyThemes{

  static background(context){
    return MediaQuery.of(context).platformBrightness==Brightness.light
        ? MyThemes.lightTheme.colorScheme.onBackground//lightColorScheme.onBackground
        : MyThemes.darkTheme.colorScheme.onBackground;//darkColorScheme.onBackground;
  }

  static final lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: lightScheme,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: lightScheme.primary
    ),
    iconTheme: IconThemeData(color: Colors.black),
  );

  static final darkTheme = ThemeData(
      useMaterial3: true,
      colorScheme: darkScheme,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: darkScheme.primary,
        foregroundColor: darkScheme.onPrimary,
      )
  );

  static const lightScheme = ColorScheme(
    brightness: Brightness.light,
    primary : Color(0xFF6750A4),
    onPrimary : Color(0xFFFFFFFF),
    primaryContainer : Color(0xFFEADDFF),
    onPrimaryContainer : Color(0xFF21005D),
    secondary : Color(0xFF625B71),
    onSecondary : Color(0xFFFFFFFF),
    secondaryContainer : Color(0xFFE8DEF8),
    onSecondaryContainer : Color(0xFF1D192B),
    tertiary : Color(0xFF7D5260),
    onTertiary : Color(0xFFFFFFFF),
    tertiaryContainer : Color(0xFFFFD8E4),
    onTertiaryContainer : Color(0xFF31111D),
    error : Color(0xFFB3261E),
    errorContainer : Color(0xFFF9DEDC),
    onError : Color(0xFFFFFFFF),
    onErrorContainer : Color(0xFF410E0B),
    background : Color(0xFFFFFBFE),
    onBackground : Color(0xFF1C1B1F),
    surface : Color(0xFFFFFBFE),
    onSurface : Color(0xFF1C1B1F),
    surfaceVariant : Color(0xFFE7E0EC),
    onSurfaceVariant : Color(0xFF49454F),
    outline : Color(0xfF79747E),
    onInverseSurface : Color(0xFFF4EFF4),
    inverseSurface : Color(0xFF313033),
    inversePrimary : Color(0xFFD0BCFF),
    shadow : Color(0xFF000000),
    surfaceTint: Color(0xFF6750A4),
    outlineVariant: Color(0xFFCAC4D0),
    scrim: Color(0xFF000000),

  );
  static const darkScheme = ColorScheme(
    brightness: Brightness.dark,
    primary : Color(0xFFD0BCFF), //originale
    //primary: Color(0xFF4A4478),
    onPrimary : Color(0xFF381E72),
    primaryContainer : Color(0xFF4F378B),
    onPrimaryContainer : Color(0xFFEADDFF),//testo button dataora
    secondary : Color(0xFFCCC2DC),
    onSecondary : Color(0xFF332D41),
    secondaryContainer : Color(0xFF4A4478),//button dataora + chips
    onSecondaryContainer : Color(0xFFE8DEF8),//testo chips
    tertiary : Color(0xFFEFB8C8),
    onTertiary : Color(0xFF492532),
    tertiaryContainer : Color(0xFF633B48),
    onTertiaryContainer : Color(0xFFFFD8E4),
    error : Color(0xFF8C1D18),
    errorContainer : Color(0xFF8C1D18),
    onError : Color(0xFF601410),
    onErrorContainer : Color(0xFFF9DEDC),
    //background : Color(0xFF1C1B1F),
    background : Color(0x00303030),//interno pulsanti
    onBackground : Color(0xFFE6E1E5),
    surface : Color(0xfF1C1B1F),
    onSurface : Color(0xFFE6E1E5),
    surfaceVariant : Color(0xFF49454F),//bo
    onSurfaceVariant : Color(0xFFCAC4D0),
    outline : Color(0xFF938F99),
    onInverseSurface : Color(0xFF1C1B1F),//bo
    inverseSurface : Color(0xFFE6E1E5),
    inversePrimary : Color(0xFF6750A4),
    shadow : Color(0xFF000000),
  );
}