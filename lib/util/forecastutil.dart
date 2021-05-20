import 'package:intl/intl.dart';

class Util{
  static String appId="c22f11e50342e064dfd5eb49d631d5f2";

  static String getFormattedDate(DateTime dateTime){
    return new DateFormat("EEEE, MMM d , y").format(dateTime);
  }
}