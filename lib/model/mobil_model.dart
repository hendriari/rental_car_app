class MobilModel {
  String name;
  String image;
  int priceDay;
  String type;
  int seat;
  int id;
  int? selectedCarPrice;
  int? subCarPrice;
  int? totalTax;

  MobilModel({
    required this.name,
    required this.image,
    required this.priceDay,
    required this.type,
    required this.seat,
    required this.id,
    this.selectedCarPrice,
    this.subCarPrice,
  });
}

var mobilModel = [
  MobilModel(
    id: 0,
    name: 'Honda Brio',
    image: 'images/mobil/honda_brio.png',
    priceDay: 400000,
    type: 'Manual / Matic',
    seat: 4,
  ),
  MobilModel(
    id: 1,
    name: 'New Avanza',
    image: 'images/mobil/new_avanza.png',
    priceDay: 450000,
    type: 'Manual / Matic',
    seat: 7,
  ),
  MobilModel(
    id: 2,
    name: 'Expander',
    image: 'images/mobil/expander.png',
    priceDay: 500000,
    type: 'Manual / Matic',
    seat: 8,
  ),
  MobilModel(
    id: 3,
    name: 'Kijang Innova',
    image: 'images/mobil/kijang_innova.png',
    priceDay: 650000,
    type: 'Manual / Matic',
    seat: 7,
  ),
  MobilModel(
    id: 4,
    name: 'Innova Reborn',
    image: 'images/mobil/innova_reborn.png',
    priceDay: 650000,
    type: 'Manual / Matic',
    seat: 7,
  ),
  MobilModel(
    id: 5,
    name: 'Fortuner',
    image: 'images/mobil/fortuner.png',
    priceDay: 1600000,
    type: 'Manual / Matic',
    seat: 7,
  ),
  MobilModel(
    id: 6,
    name: 'Pajero',
    image: 'images/mobil/pajero.png',
    priceDay: 1600000,
    type: 'Manual / Matic',
    seat: 7,
  ),
  MobilModel(
    id: 7,
    name: 'Alphard',
    image: 'images/mobil/alphard.png',
    priceDay: 2800000,
    type: 'Manual / Matic',
    seat: 7,
  ),MobilModel(
    id: 8,
    name: 'Hiace Commuter',
    image: 'images/travel/hiace_commuter.png',
    priceDay: 1200000,
    type: 'Manual',
    seat: 15,
  ),MobilModel(
    id: 9,
    name: 'Hiace Premio',
    image: 'images/travel/hiace_premo.png',
    priceDay: 1300000,
    type: 'Manual',
    seat: 14,
  ),MobilModel(
    id: 10,
    name: 'Elf Giga',
    image: 'images/travel/elf_giga.png',
    priceDay: 1400000,
    type: 'Manual',
    seat: 17,
  ),
];
