import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.10,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Coffe Shop",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 27,
                ),
                Container(
                  height: 50,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(40)),
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Card(
                    elevation: 7.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 17,
                        ),
                        Icon(Icons.search),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Pesquisar..."),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
