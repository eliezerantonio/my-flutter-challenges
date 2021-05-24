import 'package:flutter/widgets.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

class TwilioApi extends ChangeNotifier {
  static final String ACCOUNT_SID = "ACe28c4be18887462308d4d26d027030a6";
  static final String AUTH_TOKEN = "ffd32bebec7770022f0d8e251dff31d1";

  void sendSms() {
    try {
      TwilioFlutter twilioFlutter = TwilioFlutter(
          accountSid: ACCOUNT_SID, // replace *** with Account SID
          authToken: AUTH_TOKEN, // replace xxx with Auth Token
          twilioNumber: '+244924033375' // replace .... with Twilio Number
          );

      twilioFlutter.sendSMS(
          toNumber: "+244934151419", messageBody: "Oi seu merda");

      print("sucesso");
    } catch (e) {
      print("=======TWILIO======");
      print(e);
    }
  }
}
