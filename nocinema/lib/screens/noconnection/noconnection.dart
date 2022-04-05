import 'package:flutter/material.dart';

class NoConnection extends StatelessWidget {
  const NoConnection({Key? key, required this.tryConnection}) : super(key: key);
  final Function tryConnection;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Ooops! 😓",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Por favor, verifique sua conexão com a Internet",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            MaterialButton(
              onPressed: () {
                tryConnection();
              },
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 50),
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.grey[800],
              child: const Text(
                "Tentar de novo",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
