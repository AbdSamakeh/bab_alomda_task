import 'dart:io';

import 'package:easy_localization/easy_localization.dart';

//Find Difference Bwttwen Local Time And Server Time
String findDateDifference(
    {required DateTime serverDate, required DateTime localDateRating}) {
  int differenceInTime = (serverDate.millisecondsSinceEpoch -
      localDateRating.millisecondsSinceEpoch);
  int differenceInDays =
      ((differenceInTime / (1000 * 60 * 60 * 24)) % 365).toInt();
  int differenceInHours =
      ((differenceInTime / (1000 * 60 * 60)) % 24).toInt() - 3;
  int differenceInSeconds = ((differenceInTime / 1000) % 60).toInt();
  int differenceInMinutes = ((differenceInTime / (1000 * 60)) % 60).toInt();
  if (differenceInDays <= 0 &&
      differenceInHours <= 0 &&
      differenceInMinutes <= 0) {
    return '${(differenceInSeconds).abs()}';
  }
  if (differenceInDays == 0 && differenceInHours == 0) {
    return '${differenceInMinutes.toInt()}';
  }
  if (differenceInDays == 0) {
    return '${differenceInHours.toInt()}';
  }
  if (differenceInHours == 0 || differenceInHours < 0) {
    return '${differenceInDays.toInt()} ';
  }
  return '$differenceInDays , ${differenceInHours.toInt()}';
}

DateTime getLocalDateFromHttpHeader({required date}) {
  return HttpDate.parse(date);
}

//Convert Arabic Digits To English
String convertDigitsToLatin(String s) {
  var sb = StringBuffer();
  for (int i = 0; i < s.length; i++) {
    switch (s[i]) {
      //Persian digits
      case '\u06f0':
        sb.write('0');
        break;
      case '\u06f1':
        sb.write('1');
        break;
      case '\u06f2':
        sb.write('2');
        break;
      case '\u06f3':
        sb.write('3');
        break;
      case '\u06f4':
        sb.write('4');
        break;
      case '\u06f5':
        sb.write('5');
        break;
      case '\u06f6':
        sb.write('6');
        break;
      case '\u06f7':
        sb.write('7');
        break;
      case '\u06f8':
        sb.write('8');
        break;
      case '\u06f9':
        sb.write('9');
        break;

      //Arabic digits
      case '\u0660':
        sb.write('0');
        break;
      case '\u0661':
        sb.write('1');
        break;
      case '\u0662':
        sb.write('2');
        break;
      case '\u0663':
        sb.write('3');
        break;
      case '\u0664':
        sb.write('4');
        break;
      case '\u0665':
        sb.write('5');
        break;
      case '\u0666':
        sb.write('6');
        break;
      case '\u0667':
        sb.write('7');
        break;
      case '\u0668':
        sb.write('8');
        break;
      case '\u0669':
        sb.write('9');
        break;
      default:
        sb.write(s[i]);
        break;
    }
  }
  return sb.toString();
}

//Format Date Function
String convertTo24HourFormat(String time) {
  final DateFormat inputFormat = DateFormat('h:mm a');
  final DateFormat outputFormat = DateFormat('HH:mm');
  final DateTime parsedTime = inputFormat.parse(time);
  final String formattedTime = outputFormat.format(parsedTime);
  return formattedTime;
}
