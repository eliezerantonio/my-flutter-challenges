import 'package:bfa_turismo/src/models/place.dart';
import 'package:flutter/material.dart';

final DUMMY_PLACES = [
  Place(
    id: 'p1',
    title: 'Huíla',
    capital: 'Lubango',
    climate: 'Tropical',
    imageUrl: "images/huila.jpeg",
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
  ),
  Place(
    id: 'p3',
    title: 'Cunene',
    capital: 'ONDJIVA',
    climate: 'Tropical Seco',
    imageUrl: "images/cunene.jpg",
    description:
        'Na fronteira com a Namíbia, esta província terá nos povos que a habitam a sua principal riqueza. Resistindo a todo o tipo de dificuldades há séculos, sobretudo às que são impostas pela própria natureza, grupos de nómadas Koysan, de Ovambos (Kwanyamas, Cuamatos e Muvales), Nyanecas Humbes e Hereros (Mucahones e Mutuas) persistem em viver de acordo com as suas regras ancestrais.',
    temperature: '23ºC',
  ),
  Place(
    id: 'p4',
    title: 'Bengo',
    capital: 'CAXITO',
    climate: 'Tropical Seco',
    imageUrl: "images/bengo.jpg",
    description:
        'A 80 km de Luanda, o Bengo é uma das províncias com maior potencial turístico do país. As praias seduzem os visitantes para passeios de fim-de-semana ou escapadinhas de poucos dias, mas este ainda é um segredo bem guardado.',
    temperature: '26ºC',
  ),
  Place(
    id: 'p5',
    title: 'Benguela',
    capital: 'Benguela',
    climate: 'Tropical ÁRIDO',
    imageUrl: "images/benguela.jpg",
    description:
        'Na costa, as praias de areia branca e águas de azul profundo fazem de Benguela um dos destinos de férias privilegiados do país. No interior, as florestas abertas, as savanas arborizadas e a estepe são o berço de uma fauna variada e proporcionam aos mais aventureiros as emoções fortes dos safaris africanos.',
    temperature: '24ºC',
  ),
  Place(
    id: 'p6',
    title: 'Bié',
    capital: 'CUITO',
    climate: 'Tropical HÚMIDO',
    imageUrl: "images/bie.jpeg",
    description:
        'O Bié foi uma das províncias mais afectadas pela Guerra Civil. No entanto, as praias fluviais, lagoas, cascatas e florestas têm sido os seus mais fortes aliados na sua busca por integrar a rota turística do país.',
    temperature: '19ºC',
  ),
];
