

import 'package:intl/intl.dart';

class Util{
  static String appId = "70ef78d6e13d88d52398edc5b5304881";

  static String getFormattedDate(DateTime dateTime){

    return new DateFormat("EEEE, MMM d, y").format(dateTime);

  }

}