import 'package:beats_ui/src/models/product_model.dart';
import 'package:beats_ui/src/providers/products_providers.dart';
import 'package:beats_ui/src/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardsView extends StatelessWidget {
  const CardsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsProv = Provider.of<ProductosProvider>(context);
    return Container(
      width: double.infinity,
      height: 370,
      child: PageView(
        physics: BouncingScrollPhysics(),
        controller: PageController(viewportFraction: 0.9),
        children: productsProv.productos
            .map((prod) => _Card(
                  productoModel: prod,
                ))
            .toList(),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({Key key, this.productoModel}) : super(key: key);
  final ProductoModel productoModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => SecondScreen(
                  productoModel: productoModel,
                )));
      },
      child: Container(
        child: Stack(
          children: [
            Row(
              children: [
                _PrimaryDescription(
                  productoModel: productoModel,
                ),
                SizedBox(width: 55),
                _TarjetaDescription(
                  productoModel: productoModel,
                ),
              ],
            ),
            Positioned(
              top: 65,
              left: 50,
              child: Hero(
                tag: productoModel.id,
                child: Image(
                  image: AssetImage("assets/${productoModel.url}"),
                  width: 160,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _PrimaryDescription extends StatelessWidget {
  const _PrimaryDescription({Key key, this.productoModel}) : super(key: key);
  final ProductoModel productoModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: RotatedBox(
        quarterTurns: 3,
        child: Row(
          children: [
            Icon(
              FontAwesomeIcons.batteryFull,
              size: 15,
            ),
            SizedBox(width: 10),
            Text(
              "${productoModel.bateria}-Hour Battery",
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(width: 30),
            Icon(
              FontAwesomeIcons.wifi,
              size: 15,
            ),
            SizedBox(width: 10),
            Text(
              "Wireless",
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(width: 30),
          ],
        ),
      ),
    );
  }
}

class _TarjetaDescription extends StatelessWidget {
  const _TarjetaDescription({Key key, this.productoModel}) : super(key: key);
  final ProductoModel productoModel;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: size.width * 0.55,
          color: Color(productoModel.color),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(productoModel.titulo,
                        style: TextStyle(color: Colors.white24, fontSize: 30)),
                    Text(productoModel.subtitulo,
                        style: TextStyle(color: Colors.white24, fontSize: 30)),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text(
                      "Beats Studio Wireless",
                      style: TextStyle(color: Colors.white),
                    ),
                    Spacer(),
                    Icon(FontAwesomeIcons.heart, color: Colors.white),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Text(
                      '\$${productoModel.precio}',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    width: 80,
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        "Add to bag",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    width: 120,
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(30))),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
