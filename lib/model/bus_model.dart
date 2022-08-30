class BusModel {
  int id;
  String images;
  String name;
  int seat;
  int priceDay;
  String crew;
  int? selectedBusPrice;
  int? subBusPrice;
  int? totalTaxBus;

  BusModel({
    required this.id,
    required this.images,
    required this.name,
    required this.seat,
    required this.priceDay,
    required this.crew,
    this.selectedBusPrice,
    this.subBusPrice,
  });
}

var busModel = [
  BusModel(
      id: 0,
      images: 'images/bus/bus_35_seat.png',
      name: 'Bus 35 Seat',
      seat: 35,
      priceDay: 3500000,
      crew: 'Include Crew'),
  BusModel(
    id: 1,
    images: 'images/bus/bus_55_seat.png',
    name: 'Bus 55 Seat',
    seat: 55,
    priceDay: 4700000,
    crew: 'Include Crew',
  ),
];
