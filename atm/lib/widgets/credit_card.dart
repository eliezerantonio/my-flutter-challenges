import 'package:atm/models/user_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:credit_card/credit_card_model.dart';
import 'package:credit_card/flutter_credit_card.dart';

class MyCreditCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyCreditCardState();
  }
}

class MyCreditCardState extends State<MyCreditCard> {
  
  String cardNumber = '';
  String expiryDate = '12/21';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserManager>().client;
  String cardHolderName = user.name;

    return Container(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isCvvFocused = !isCvvFocused;
          });
        },
        child: CreditCardWidget(
          height: 200,
          width: 340,
          cardBgColor: Colors.transparent,
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: isCvvFocused,
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
