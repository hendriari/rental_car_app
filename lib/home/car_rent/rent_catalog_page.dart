import 'package:flutter/material.dart';
import 'package:rent_app/home/car_rent/car_detail_payment.dart';
import 'package:rent_app/model/add_item.dart';
import 'package:rent_app/model/mobil_model.dart';
import 'package:rent_app/model/singleton_model.dart';
import 'package:intl/intl.dart';

class RentCatalog extends StatefulWidget {
  final String? start;
  final String? end;
  final String? location;
  final String? driver;

  const RentCatalog({
    Key? key,
    required this.start,
    required this.end,
    required this.location,
    required this.driver,
  }) : super(key: key);

  @override
  State<RentCatalog> createState() => _RentCatalogState();
}

class _RentCatalogState extends State<RentCatalog> {
  List<MobilModel> mobils = mobilModel;
  late SingletonModel _model;
  late double sizeHeight = MediaQuery.of(context).size.height;
  late double sizeWidth = MediaQuery.of(context).size.width;
  PageController pageController = PageController();
  String? _start;
  String? _end;
  String? _location;
  String? _driver;

  @override
  void initState() {
    super.initState();
    _start = widget.start;
    _end = widget.end;
    _location = widget.location;
    _driver = widget.driver;
    _model = SingletonModel.withContext(context);
    _model.addItem = [];
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: Stack(
          children: [
            _header(),
            if (_model.addItem!.isNotEmpty)
              Positioned(bottom: 20, left: 10, right: 10, child: _selectCar())
          ],
        ));
  }

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
                          'Car Catalog',
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
                  'Rented Car',
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

  Widget _content() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (context, index) {
        final MobilModel mobil = mobilModel[index];
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
                            mobil.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 16),
                          )),
                          Center(
                              child: Text(
                            mobil.type,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey),
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
                                '${mobil.seat} Seat',
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
                                Icons.verified_user,
                                color: Colors.amber,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Vehicle Insurance',
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
                                    .format(mobil.priceDay),
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
                          _model.addItem!
                                  .where((element) =>
                                      element.itemMobil.id == mobil.id)
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
                                            _model.addItem!.add(AddItem(
                                                itemMobil: mobil,
                                                jumlahItem: 1));
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
                                          AddItem select = _model.addItem!
                                              .where((element) =>
                                                  element.itemMobil.id ==
                                                  mobil.id)
                                              .first;
                                          setState(() {
                                            if (select.jumlahItem == 1) {
                                              _model.addItem!.removeWhere(
                                                  (element) =>
                                                      element.itemMobil.id ==
                                                      mobil.id);
                                            } else {
                                              _model.addItem!
                                                  .where((element) =>
                                                      element.itemMobil.id ==
                                                      mobil.id)
                                                  .first
                                                  .jumlahItem--;
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
                                            '${_model.addItem!.where((element) => element.itemMobil.id == mobil.id).first.jumlahItem}'),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _model.addItem!
                                                .where((element) =>
                                                    element.itemMobil.id ==
                                                    mobil.id)
                                                .first
                                                .jumlahItem++;
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
                          mobil.image,
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
      itemCount: mobilModel.length,
    );
  }

  Widget _selectCar() {
    int selectCars = 0;
    for (var element in _model.addItem!) {
      selectCars += element.jumlahItem;
    }

    int subPrice = 0;
    for (var element in _model.addItem!) {
      subPrice = element.itemMobil.priceDay * element.jumlahItem;
      element.itemMobil.subCarPrice = subPrice;
    }

    int totalPrice = 0;
    for (var element in _model.addItem!) {
      totalPrice += element.itemMobil.priceDay * element.jumlahItem;
      element.itemMobil.selectedCarPrice = totalPrice;
    }

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CarDetailPayment(
                      start: _start,
                      end: _end,
                      location: _location,
                      driver: _driver,
                    )));
        setState(() {
          _model = SingletonModel.shared;
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
                '$selectCars Cars',
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
