class TravelModel{
  String images;
  String name;
  int seat;
  int priceDay;
  int id;

  TravelModel({
    required this.images,
    required this.name,
    required this.seat,
    required this.priceDay,
    required this.id,
});
}

var travelModel = [
  TravelModel(
    id: 0,
    images: 'images/travel/hiace_commuter.png',
    name: 'Hiace Commuter',
    seat: 15,
    priceDay: 1200000,
  ),TravelModel(
    id: 1,
    images: 'images/travel/hiace_premo.png',
    name: 'Hiace Premio',
    seat: 14,
    priceDay: 1300000,
  ),TravelModel(
    id: 2,
    images: 'images/travel/elf_giga.png',
    name: 'Elf Giga',
    seat: 17,
    priceDay: 1400000,
  ),
];