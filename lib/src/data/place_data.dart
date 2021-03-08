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
    points: [
      ["Cristo Rei",   "A estátua de Cristo Rei é um monumento e santuário católico com vista para a cidade de Lubango, no sul de Angola. Foi inspirado na estátua do Cristo Redentor no Rio de Janeiro, como uma das quatro únicas no mundo. Esta estátua de mármore branco com 30 metros de altura foi construída em 1957",
        "-13.735941,12.3715226"],
      [
        "Fenda Da Tundavala",
        "A estátua de Cristo Rei é um monumento e santuário católico com vista para a cidade de Lubango, no sul de Angola. Foi inspirado na estátua do Cristo Redentor no Rio de Janeiro, como uma das quatro únicas no mundo. Esta estátua de mármore branco com 30 metros de altura foi construída em 1957",
        "-13.735941,12.3715226"
      ],
    ],
  ),
  Place(
    id: 'p2',
    title: 'Namibe',
    capital: 'Moçâmedes',
    climate: 'Tropical Seco',
    imageUrl: "images/namibe.jpg",
    description:
        '“Terra da Felicidade” é assim que é conhecida a província do deserto, da Welwitschia Mirabilis, flor de duas únicas folhas que só nasce nesta região, do Parque do Iona, mas também das praias desertas, dos hotéis com localizações inesperadas e das famosas Pinturas.',
    temperature: '21ºC',
  points: [
      ["Parque da Iona", "O Parque do Iona, com a sua vida selvagem e biodiversidade rica, destacando-se a welwitschia mirabilis, uma planta endémica do deserto do Namibe e que simboliza a região Sul de Angola e Norte da Namíbia.", "-16.24992,11.7626166"],
      [
        "Deserto do namibe",
        "A estátua de Cristo Rei é um monumento e santuário católico com vista para a cidade de Lubango, no sul de Angola. Foi inspirado na estátua do Cristo Redentor no Rio de Janeiro, como uma das quatro únicas no mundo. Esta estátua de mármore branco com 30 metros de altura foi construída em 1957",
        "-13.735941,12.3715226"
      ],
    ],
  ),
  Place(
    id: 'p3',
    title: 'Cunene',
    capital: 'Ondjiva',
    climate: 'Tropical Seco',
    imageUrl: "images/cunene.jpg",
    description:
        'Na fronteira com a Namíbia, esta província terá nos povos que a habitam a sua principal riqueza. Resistindo a todo o tipo de dificuldades há séculos, sobretudo às que são impostas pela própria natureza, grupos de nómadas Koysan, de Ovambos (Kwanyamas, Cuamatos e Muvales), Nyanecas Humbes e Hereros (Mucahones e Mutuas) persistem em viver de acordo com as suas regras ancestrais.',
    temperature: '23ºC',
    points: [
      [
        "Praia Pambala",
        "Na Praia Pambala, a água do mar é limpa e fresca, onde só se ouve o barulho das ondas e dos pássaros. O local ideal para desanuviar do stress provocado pela semana de trabalho.",
        "-8.6061398, 13.1740878"
      ]
    ],
  ),
  Place(
    id: 'p4',
    title: 'Bengo',
    capital: 'Caxito',
    climate: 'Tropical Seco',
    imageUrl: "images/bengo.jpg",
    description:
        'A 80 km de Luanda, o Bengo é uma das províncias com maior potencial turístico do país. As praias seduzem os visitantes para passeios de fim-de-semana ou escapadinhas de poucos dias, mas este ainda é um segredo bem guardado.',
    temperature: '26ºC',
    points: [
      [
        "Praia Pambala",
        "Na Praia Pambala, a água do mar é limpa e fresca, onde só se ouve o barulho das ondas e dos pássaros. O local ideal para desanuviar do stress provocado pela semana de trabalho.",
        "-8.6061398, 13.1740878"
      ],
      [
        "Praia Pambala",
        "Na Praia Pambala, a água do mar é limpa e fresca, onde só se ouve o barulho das ondas e dos pássaros. O local ideal para desanuviar do stress provocado pela semana de trabalho.",
        "-8.6061398, 13.1740878"
      ],
    ],
  ),
  Place(
    id: 'p5',
    title: 'Benguela',
    capital: 'Benguela',
    climate: 'Tropical Árido',
    imageUrl: "images/benguela.jpg",
    description:
        'Na costa, as praias de areia branca e águas de azul profundo fazem de Benguela um dos destinos de férias privilegiados do país. No interior, as florestas abertas, as savanas arborizadas e a estepe são o berço de uma fauna variada e proporcionam aos mais aventureiros as emoções fortes dos safaris africanos.',
    temperature: '24ºC',
    points: [
      ["Cristo Rei", "Statua", "latitude e longitude"],
      [
        "Fenda Da Tundavala",
        "A estátua de Cristo Rei é um monumento e santuário católico com vista para a cidade de Lubango, no sul de Angola. Foi inspirado na estátua do Cristo Redentor no Rio de Janeiro, como uma das quatro únicas no mundo. Esta estátua de mármore branco com 30 metros de altura foi construída em 1957",
        "-13.735941,12.3715226"
      ],
    ],
  ),
  Place(
    id: 'p6',
    title: 'Bié',
    capital: 'Cuito',
    climate: 'Tropical Húmido',
    imageUrl: "images/bie.jpeg",
    description:
        'O Bié foi uma das províncias mais afectadas pela Guerra Civil. No entanto, as praias fluviais, lagoas, cascatas e florestas têm sido os seus mais fortes aliados na sua busca por integrar a rota turística do país.',
    temperature: '19ºC',
  points: [
      ["Cristo Rei", "Statua", "latitude e longitude"],
      [
        "Fenda Da Tundavala",
        "A estátua de Cristo Rei é um monumento e santuário católico com vista para a cidade de Lubango, no sul de Angola. Foi inspirado na estátua do Cristo Redentor no Rio de Janeiro, como uma das quatro únicas no mundo. Esta estátua de mármore branco com 30 metros de altura foi construída em 1957",
        "-13.735941,12.3715226"
      ],
    ],
  ),
  Place(
    id: 'p7',
    title: 'Cabinda',
    capital: 'Cabinda',
    climate: 'Tropical Húmido',
    imageUrl: "images/cabinda.jpg",
    description:
        'Ao ouvirmos falar de Cabinda associamos imediatamente esta província aos poços de prospecção de petróleo que a tornam numa das zonas mais ricas do país. Porém, o enclave oferece muitas outras surpresas a quem o visitar, com natural destaque para a Floresta do Maiombe.',
    temperature: '25ºC',
     points: [
      ["Cristo Rei", "Statua", "latitude e longitude"],
      [
        "Fenda Da Tundavala",
        "A estátua de Cristo Rei é um monumento e santuário católico com vista para a cidade de Lubango, no sul de Angola. Foi inspirado na estátua do Cristo Redentor no Rio de Janeiro, como uma das quatro únicas no mundo. Esta estátua de mármore branco com 30 metros de altura foi construída em 1957",
        "-13.735941,12.3715226"
      ],
    ],
  ),
  Place(
    id: 'p8',
    title: 'Cuando Cubango',
    capital: 'Menongue',
    climate: 'Semíario',
    imageUrl: "images/cuando_cubango.jpg",
    description:
        'Em tempos conhecida como as “Terras do Fim do Mundo”, a província do Cuando Cubango encara agora o futuro com esperança. As riquezas minerais escondidas no seu subsolo competem com a paisagem mágica dos parques e reservas naturais',
    temperature: '20ºC',
    points: [
      ["Cristo Rei", "Statua", "latitude e longitude"],
      [
        "Fenda Da Tundavala",
        "A estátua de Cristo Rei é um monumento e santuário católico com vista para a cidade de Lubango, no sul de Angola. Foi inspirado na estátua do Cristo Redentor no Rio de Janeiro, como uma das quatro únicas no mundo. Esta estátua de mármore branco com 30 metros de altura foi construída em 1957",
        "-13.735941,12.3715226"
      ],
    ],
  ),
  Place(
    id: 'p9',
    title: 'Cuanza Norte',
    capital: "N'dalatando",
    climate: 'Tropical Húmido',
    imageUrl: "images/cuanza_norte.jpg",
    description:
        'Por entre terrenos pintados de verde intenso decorreram momentos importantes da história de Angola. Por isso mesmo, são de visitar quer as belezas naturais da província, quer os testemunhos que o homem por aqui vem deixando ao longo de séculos.',
    temperature: '23ºC',
  points: [
      ["Cristo Rei", "Statua", "latitude e longitude"],
      [
        "Fenda Da Tundavala",
        "A estátua de Cristo Rei é um monumento e santuário católico com vista para a cidade de Lubango, no sul de Angola. Foi inspirado na estátua do Cristo Redentor no Rio de Janeiro, como uma das quatro únicas no mundo. Esta estátua de mármore branco com 30 metros de altura foi construída em 1957",
        "-13.735941,12.3715226"
      ],
    ],
  ),
  Place(
    id: 'p10',
    title: 'Cuanza Sul',
    capital: "Sumbe",
    climate: 'Tropical Húmido',
    imageUrl: "images/cuanza_sul.jpg",
    description:
        'No interior, as terras férteis do Waku Kungo produzem muito mais que o café que merece uma “rota” própria na província. Na costa, as praias do Sumbe e Porto Amboim convidam a um mergulho. Por todo o território, os rios Cuanza, Longa, Queve e Cubal oferecem paisagens de sonho.',
    temperature: '23ºC',
  points: [
      ["Cristo Rei", "Statua", "latitude e longitude"],
      [
        "Fenda Da Tundavala",
        "A estátua de Cristo Rei é um monumento e santuário católico com vista para a cidade de Lubango, no sul de Angola. Foi inspirado na estátua do Cristo Redentor no Rio de Janeiro, como uma das quatro únicas no mundo. Esta estátua de mármore branco com 30 metros de altura foi construída em 1957",
        "-13.735941,12.3715226"
      ],
    ],
  ),
  Place(
    id: 'p11',
    title: 'Huambo',
    capital: "Huambo",
    climate: 'Tropical de Altitude',
    imageUrl: "images/huambo.jpg",
    description:
        'Em pleno Planalto Central, o Huambo foi berço de reinos antigos que se impuseram pela sua resiliência e resistência. Na época colonial, ali nasceu, de raiz, a cidade a que chamaram de “Nova Lisboa” e que se pretendia que viesse a ser a capital da colónia.',
    temperature: '19ºC',
      points: [
      ["Cristo Rei", "Statua", "latitude e longitude"],
      [
        "Fenda Da Tundavala",
        "A estátua de Cristo Rei é um monumento e santuário católico com vista para a cidade de Lubango, no sul de Angola. Foi inspirado na estátua do Cristo Redentor no Rio de Janeiro, como uma das quatro únicas no mundo. Esta estátua de mármore branco com 30 metros de altura foi construída em 1957",
        "-13.735941,12.3715226"
      ],
    ],
  ),
  Place(
    id: 'p12',
    title: 'Luanda',
    capital: "Luanda",
    climate: 'Tropical seco',
    imageUrl: "images/luanda.jpg",
    description:
        'Fundada em 1575 (1576), sob o nome de São Paulo da Assunção de Loanda, a capital do país cresceu sem parar desde então e é hoje uma cidade com quase sete milhões de habitantes. Testemunha e personagem principal da história do país, Luanda é cosmopolita e repleta de atracções para os seus habitantes e visitantes.',
    temperature: '25ºC',
    points: [
      [
        "Baía De Luanda",
        "A Baía de Luanda, cujas águas são protegidas pela Ilha de Luanda, foi o lugar de fundação da cidade por Paulo Dias de Novais em 1575.Continua até hoje a ser o cartão postal da cidade.",
        "-8.810277,+13.231640"
      ],
      [
        "Ilha do Cabo",
        "Descritas por poetas, cantores com uma saudade impar, Ilha do Cabo é um cordão litoral composto por uma estreita língua de terra com 7 km de comprimento que separa a cidade de Luanda do Oceano Atlântico e originou a Baía de Luanda.",
        "-10.6928128,12.3845321"
      ],
    ],
  ),
  Place(
    id: 'p13',
    title: 'Lunda Norte',
    capital: "Dundo",
    climate: 'Tropical Humido',
    imageUrl: "images/lunda_norte.jpg",
    description:
        'As pedras preciosas deram fama a uma província que revela muitos outros tesouros a quem a visita, das antigas cidades traçadas a régua e esquadro às paisagens de fazer perder a respiração e onde a água está sempre presente.',
    temperature: '25ºC',
    points: [
      [
        "Museu Etnográfico Do Dundo",
        "O Museu Etnográfico do Dundo, o primeiro museu de Angola e um dos maiores a sul do Saara, que exibe um acervo da região e do país, com destaque para a cultura Cokwe e a sua mais famosa estatueta Mwana Pwo, que idealiza os valores femininos, assim como para a célebre estatueta que hoje representa Angola no mundo, a Samanyonga (O Pensador).",
        "-9.9647949,12.613236"
      ],
      [
        "Lagoa de Carumbo",
        "A Lagoa de Carumbo, uma das Sete Maravilhas Naturais de Angola, a cerca de 170 quilómetros do Dundo.",
        "-9.9495846,12.4076322"
      ],
    ],
  ),
  Place(
    id: 'p14',
    title: 'Lunda Sul',
    capital: "Saurimo",
    climate: 'Savana Tropical',
    imageUrl: "images/lunda_sul.jpg",
    description:
        'A Lunda Sul tem vindo a desligar-se da sua imagem de uma província com diamantes para se assumir como um destino com valiosos lugares para serem conhecidos. O seu imenso potencial turístico já é reconhecido por todos.',
    temperature: '22ºC',
    points: [
      [
        "Quedas Do Rio Chiumbe",
        "Para visitar na província da Lunda-Sul são as bonitas Quedas do Rio Chiumbe, uma das Sete Maravilhas Naturais de Angola e o seu Miradouro, local perfeito para visualizar o quadro edílico e inesquecível.",
        "-11.9267938,12.373994"
      ],
      [
        "Sé Catedral De Saurimo",
        "A imponência da Sé Catedral de Saurimo e dos seus jardins, construída entre 1958 e 1959 e dedicada a Nossa Senhora de Assunção.",
        "-10.9070871,12.4105619"
      ],
    ],
  ),
  Place(
    id: 'p15',
    title: 'Malanje',
    capital: "Malanje",
    climate: 'Tropical Húmido',
    imageUrl: "images/malanje.jpg",
    description:
        'Se há província em Angola que é privilegiada pelas suas belezas naturais Malanje é uma delas. Não é por acaso que este é um dos destinos mais procurado por quem não abdica do descanso ao mesmo tempo que conhece alguns dos pontos mais turísticos do país.',
    temperature: '22ºC',
    points: [
      [
        "Quedas Do Rio Chiumbe",
        "Para visitar na província da Lunda-Sul são as bonitas Quedas do Rio Chiumbe, uma das Sete Maravilhas Naturais de Angola e o seu Miradouro, local perfeito para visualizar o quadro edílico e inesquecível.",
        "-11.9267938,12.373994"
      ],
      [
        "Sé Catedral De Saurimo",
        "A imponência da Sé Catedral de Saurimo e dos seus jardins, construída entre 1958 e 1959 e dedicada a Nossa Senhora de Assunção.",
        "-10.9070871,12.4105619"
      ],
    ],
  ),
];
