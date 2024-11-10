class ContentData {
  final String image;
  final String name;
  final String type;
  final String description;
  ContentData({
    required this.image,
    required this.name,
    required this.type,
    required this.description,
  });
}

final listGridContentData = [
  ContentData(
    image: 'assets/data/luka-bakar.png',
    name: 'Luka Bakar',
    type: 'Medis',
    description:
        'Luka bakar terjadi ketika kulit terkena panas yang cukup tinggi. Luka bakar dapat terjadi akibat terkena api, air panas, uap panas, benda panas, sinar matahari, atau bahan kimia.',
  ),
  ContentData(
    image: 'assets/data/demam-berdarah.png',
    name: 'Demam Berdarah',
    type: 'Medis',
    description:
        'Demam berdarah adalah penyakit yang disebabkan oleh virus dengue yang dibawa oleh nyamuk Aedes aegypti. Penyakit ini dapat menyerang siapa saja, baik anak-anak maupun orang dewasa.',
  ),
  ContentData(
    image: 'assets/data/tsunami.png',
    name: 'Tsunami',
    type: 'Bencana',
    description:
        'Tsunami adalah gelombang besar yang terjadi di laut akibat gempa bumi, letusan gunung berapi, atau longsor. Tsunami dapat menyebabkan kerusakan yang sangat besar di daratan dan bahkan menelan',
  ),
];
