import 'dart:io';

import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';
import 'package:path_provider/path_provider.dart';

class HtmlConverter{
  static Future<File> generate(String societa,String oraImmersione,String dataImmersione,String luogo,String partecipanti,String staff,String barca,String dataCompilazione,String oraCompilazione) async {
    /*const String societa = "VENTOTENE DIVING ACADEMY";
    const String oradata = "16:00 19/02/2022";
    const String luogo = "S.Stefano";
    const String partecipanti = "1";
    const String staff = "Vladimiro";
    const String barca = "Gommone";
    const String data = "19/02/2022";
    const String ora = "16:00";*/
    String htmlContent ="""
<html>

<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=Generator content="Microsoft Word 15 (filtered)">
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@SimSun";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin-top:0in;
	margin-right:0in;
	margin-bottom:8.0pt;
	margin-left:0in;
	line-height:107%;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{font-family:"Calibri",sans-serif;}
.MsoPapDefault
	{margin-bottom:8.0pt;
	line-height:107%;}
@page WordSection1
	{size:595.3pt 841.9pt;
	margin:70.85pt 56.7pt 56.7pt 56.7pt;}
div.WordSection1
	{page:WordSection1;}
-->
</style>

</head>

<body lang=EN-US style='word-wrap:break-word'>

<div class=WordSection1>

<p class=MsoNormal><span lang=IT>ALLEGATO 6</span></p>

<p class=MsoNormal><span lang=IT>&nbsp;</span></p>

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0
 style='border-collapse:collapse;border:none'>
 <tr>
  <td width=642 valign=top style='width:481.4pt;border:none;border-bottom:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-bottom:0in;text-align:center;
  line-height:150%'><b><span lang=IT>SOCETA’/CIRCOLO
  SPORTIVO/ASSOCIAZIONE/IMPRESA</span></b></p>
  </td>
 </tr>
 <tr>
  <td width=642 valign=top style='width:481.4pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-bottom:0in;line-height:normal'><b><span
  lang=IT style='font-size:20.0pt'>"""+societa+"""</span></b></p>
  </td>
 </tr>
 <tr>
  <td width=642 valign=top style='width:481.4pt;border:none;border-bottom:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:12.0pt;margin-right:0in;
  margin-bottom:0in;margin-left:0in;text-align:center;line-height:150%'><b><span
  lang=IT>DATA ORA PREVISTA IMERSIONE</span></b></p>
  </td>
 </tr>
 <tr>
  <td width=642 valign=top style='width:481.4pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-bottom:0in;line-height:normal'><b><span
  lang=IT style='font-size:20.0pt'>"""+oraImmersione+" "+dataImmersione+"""</span></b></p>
  </td>
 </tr>
 <tr>
  <td width=642 valign=top style='width:481.4pt;border:none;border-bottom:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:12.0pt;margin-right:0in;
  margin-bottom:0in;margin-left:0in;text-align:center;line-height:150%'><b><span
  lang=IT>LUOGO</span></b></p>
  </td>
 </tr>
 <tr>
  <td width=642 valign=top style='width:481.4pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-bottom:0in;line-height:normal'><b><span
  lang=IT style='font-size:20.0pt'>"""+luogo+"""</span></b></p>
  </td>
 </tr>
 <tr>
  <td width=642 valign=top style='width:481.4pt;border:none;border-bottom:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:12.0pt;margin-right:0in;
  margin-bottom:0in;margin-left:0in;text-align:center;line-height:150%'><b><span
  lang=IT>NUMERO DEI PARTECIPANTI</span></b></p>
  </td>
 </tr>
 <tr>
  <td width=642 valign=top style='width:481.4pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-bottom:0in;line-height:normal'><b><span
  lang=IT style='font-size:20.0pt'>"""+partecipanti+"""</span></b></p>
  </td>
 </tr>
 <tr>
  <td width=642 valign=top style='width:481.4pt;border:none;border-bottom:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:12.0pt;margin-right:0in;
  margin-bottom:0in;margin-left:0in;text-align:center;line-height:150%'><b><span
  lang=IT>NOMINATIVO ISTRUTTORE/I RESPONSABILE/I ED EVENTUALI ASSISTENTI</span></b></p>
  </td>
 </tr>
 <tr>
  <td width=642 valign=top style='width:481.4pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-bottom:0in;line-height:normal'><b><span
  lang=IT style='font-size:20.0pt'>"""+staff+"""</span></b></p>
  </td>
 </tr>
 <tr>
  <td width=642 valign=top style='width:481.4pt;border:none;border-bottom:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:12.0pt;margin-right:0in;
  margin-bottom:0in;margin-left:0in;text-align:center;line-height:150%'><b><span
  lang=IT>UNITA’ NAVALE UTILIZZATA</span></b></p>
  </td>
 </tr>
 <tr>
  <td width=642 valign=top style='width:481.4pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-bottom:0in;line-height:normal'><b><span
  lang=IT style='font-size:20.0pt'>"""+barca+"""</span></b></p>
  <p class=MsoNormal style='margin-bottom:0in;line-height:normal'><b><span
  lang=IT style='font-size:20.0pt'>&nbsp;</span></b></p>
  </td>
 </tr>
 <tr>
  <td width=642 valign=top style='width:481.4pt;border:none;border-bottom:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:12.0pt;margin-right:0in;
  margin-bottom:0in;margin-left:0in;text-align:center;line-height:150%'><b><span
  lang=IT>MODALITA’ OPERATIVE</span></b></p>
  </td>
 </tr>
 <tr style='height:75.2pt'>
  <td width=642 valign=top style='width:481.4pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt;height:75.2pt'>
  <p class=MsoNormal style='margin-bottom:0in;line-height:normal'><b><span
  lang=IT style='font-size:20.0pt'>&nbsp;</span></b></p>
  </td>
 </tr>
 <tr>
  <td width=642 valign=top style='width:481.4pt;border:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-bottom:0in;line-height:normal'><span
  lang=IT>&nbsp;</span></p>
  <p class=MsoNormal style='margin-bottom:0in;line-height:normal'><span
  lang=IT>&nbsp;</span></p>
  <p class=MsoNormal style='margin-bottom:0in;line-height:normal'><span
  lang=IT>&nbsp;</span></p>
  </td>
 </tr>
</table>

<p class=MsoNormal><b><span lang=IT style='font-size:14.0pt;line-height:107%;'>DATA</span></b>
<span lang=IT> </span><span lang=IT style='font-size:14.0pt;line-height:107%'>"""+dataCompilazione+"""</span>
<b><span lang=IT style='font-size:14.0pt;line-height:107%;'>ORA</b> </span>
<span style='font-size:14.0pt;line-height:107%'>"""+oraCompilazione+"""</span></p>

</div>

</body>

</html>
""";

    //Directory appDocDir = await getApplicationDocumentsDirectory();
    Directory appDocDir = await getTemporaryDirectory();

    final targetPath = appDocDir.path;
    const targetFileName = "Allegato6";

    final generatedPdfFile = await FlutterHtmlToPdf.convertFromHtmlContent(htmlContent, targetPath, targetFileName);
    return generatedPdfFile;

  }
}