import 'package:bfa_turismo/src/models/place.dart';
import 'package:flutter/material.dart';

final DUMMY_PLACES = [
  Place(
    id: 'p1',
    title: 'Huíla',
    capital: 'Lubango',
    climate: 'Tropical',
    imageUrl: "images/huila.jpg",
    description:
        'A mais de 1.000 metros de altitude e chegando aos 2.300 nos seus pontos mais elevados, a província da Huíla é marcada pelo final do Planalto Central e irrigada pelas imensas bacias hidrográficas do Cunene e do Cubango. Especialmente fértil, é também a província das belas paisagens de abismos e cascatas.',
    temperature: '20ºC',
  ),
  Place(
    id: 'p2',
    title: 'Namibe',
    capital: 'MOÇÂMEDES',
    climate: 'Tropical Seco',
    imageUrl: "images/namibe.jpg",
    description:
        '“Terra da Felicidade” é assim que é conhecida a província do deserto, da Welwitschia Mirabilis, flor de duas únicas folhas que só nasce nesta região, do Parque do Iona, mas também das praias desertas, dos hotéis com localizações inesperadas e das famosas Pinturas.',
    temperature: '21ºC',
  )
];
