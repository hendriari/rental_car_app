import 'package:flutter/material.dart';
import 'package:rent_app/home/bus_rent/bus_detail_payment.dart';
import 'package:rent_app/model/bus_model.dart';
import 'package:rent_app/model/item_bus.dart';
import 'package:rent_app/model/singleton_model.dart';
import 'package:intl/intl.dart';

class BusCatalog extends StatefulWidget {
  final String? start;
  final String? end;
  final String? location;
  final String? destination;

  const BusCatalog({
    Key? key,
    required this.start,
    required this.end,
    required this.location,
    required this.destination,
  }) : super(key: key);

  @override
  State<BusCatalog> createState() => _BusCatalogState();
}

class _BusCatalogState extends State<BusCatalog> {
  late SingletonModel _modelBus;
  late double sizeHeight = MediaQuery.of(context).size.height;
  late double sizeWidth = MediaQuery.of(context).size.width;
  String? _start;
  String? _end;
  String? _location;
  String? _destination;

  @override
  void initState() {
    super.initState();
    _start = widget.start;
    _end = widget.end;
    _location = widget.location;
    _destination = widget.destination;
    _modelBus = SingletonModel.withContext(context);
    _modelBus.addItemBus = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: Stack(
          children: [
            _header(),
            if (_modelBus.addItemBus!.isNotEmpty)
              Positioned(bottom: 20, left: 10, right: 10, child: _selectCar())
          ],
        ));
  }

  ///header
  Widget _header() {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: sizeHeight * 0.07,
            color: Colors.amber,
          ),
          Stack(
            children: [
              Container(
                height: 170,
              ),
              Container(
                height: 40,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(70),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkResponse(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.black),
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Padding(
                        padding: EdgeInsets.only(right: 45.0),
                        child: Text(
                          'Bus Catalog',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 18),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 30,
                left: 10,
                right: 10,
                child: Container(
                  height: 130,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(1, 3),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Start Date',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.calendar_month_outlined),
                                      Text('$_start')
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'End Date',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.calendar_month_outlined),
                                      Text('$_end')
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Text(
                  'Rented Bus',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              _content(),
              const SizedBox(
                height: 80,
                child: Center(
                    child: Text(
                  'no more data',
                  style: TextStyle(color: Colors.grey),
                )),
              )
            ],
          ),
        ],
      ),
    );
  }

  ///kodingan katalog bis
  Widget _content() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (context, index) {
        final BusModel bus = busModel[index];
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(1, 4),
                        blurRadius: 4,
                        color: Colors.black54),
                  ],
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 190,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                              child: Text(
                            bus.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 16),
                          )),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.airline_seat_recline_extra,
                                size: 20,
                                color: Colors.amber,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '${bus.seat} Seat',
                                style: const TextStyle(fontSize: 12),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.local_gas_station,
                                color: Colors.amber,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                'Include BBM',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.add_reaction,
                                color: Colors.amber,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Include Crew',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                            child: Text(
                              'Price',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                NumberFormat.currency(
                                        locale: 'id',
                                        symbol: 'IDR ',
                                        decimalDigits: 0)
                                    .format(bus.priceDay),
                                style: const TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.w600),
                              ),
                              const Text(
                                ' / Day',
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          _modelBus.addItemBus!
                                  .where(
                                      (element) => element.itemBus.id == bus.id)
                                  .isEmpty
                              ? Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Container(
                                        height: 30,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.black,
                                            boxShadow: const [
                                              BoxShadow(
                                                  blurRadius: 4,
                                                  offset: Offset(1, 4),
                                                  color: Colors.black54)
                                            ]),
                                        child: InkWell(
                                          onTap: () => setState(() {
                                            _modelBus.addItemBus!.add(
                                                AddItemBus(
                                                    itemBus: bus,
                                                    jumlahItemBus: 1));
                                          }),
                                          child: const Center(
                                              child: Text(
                                            'Select',
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                        )),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          AddItemBus select = _modelBus
                                              .addItemBus!
                                              .where((element) =>
                                                  element.itemBus.id == bus.id)
                                              .first;
                                          setState(() {
                                            if (select.jumlahItemBus == 1) {
                                              _modelBus.addItemBus!.removeWhere(
                                                  (element) =>
                                                      element.itemBus.id ==
                                                      bus.id);
                                            } else {
                                              _modelBus.addItemBus!
                                                  .where((element) =>
                                                      element.itemBus.id ==
                                                      bus.id)
                                                  .first
                                                  .jumlahItemBus--;
                                            }
                                          });
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: const BoxDecoration(
                                            color: Colors.black,
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(
                                            Icons.arrow_left,
                                            size: 25,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                            '${_modelBus.addItemBus!.where((element) => element.itemBus.id == bus.id).first.jumlahItemBus}'),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _modelBus.addItemBus!
                                                .where((element) =>
                                                    element.itemBus.id ==
                                                    bus.id)
                                                .first
                                                .jumlahItemBus++;
                                          });
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: const BoxDecoration(
                                            color: Colors.black,
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(
                                            Icons.arrow_right,
                                            size: 25,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                        ],
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset(
                          bus.images,
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        );
      },
      itemCount: busModel.length,
    );
  }

  ///kodingan stack total bis dipilih
  Widget _selectCar() {
    int selectCars = 0;
    for (var element in _modelBus.addItemBus!) {
      selectCars += element.jumlahItemBus;
    }

    int subPrice = 0;
    for (var element in _modelBus.addItemBus!) {
      subPrice = element.itemBus.priceDay * element.jumlahItemBus;
      element.itemBus.subBusPrice = subPrice;
    }

    int totalPrice = 0;
    for (var element in _modelBus.addItemBus!) {
      totalPrice += element.itemBus.priceDay * element.jumlahItemBus;
      element.itemBus.selectedBusPrice = totalPrice;
    }

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BusDetailPayment(
                      start: _start,
                      end: _end,
                      location: _location,
                      destination: _destination,
                    )));
        setState(() {
          _modelBus = SingletonModel.shared;
        });
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(1, 3), color: Colors.black54, blurRadius: 3)
            ]),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Row(
            children: [
              Text(
                '$selectCars Bus',
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Text(
                NumberFormat.currency(
                        locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                    .format(totalPrice),
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
