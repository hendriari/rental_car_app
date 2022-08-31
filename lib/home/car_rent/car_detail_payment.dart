import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rent_app/home/dialog/payment_waiting.dart';
import 'package:rent_app/model/payment_model.dart';
import 'package:rent_app/model/singleton_model.dart';

class CarDetailPayment extends StatefulWidget {
  final String? start;
  final String? end;
  final String? location;
  final String? driver;

  const CarDetailPayment({
    Key? key,
    required this.start,
    required this.end,
    required this.location,
    required this.driver,
  }) : super(key: key);

  @override
  State<CarDetailPayment> createState() => _CarDetailPaymentState();
}

class _CarDetailPaymentState extends State<CarDetailPayment> {
  late double sizeHeight = MediaQuery.of(context).size.height;
  late double sizeWidth = MediaQuery.of(context).size.width;
  late SingletonModel _model;
  late TextEditingController _controllerPayment;
  late GlobalKey<FormState> _key;
  String? _start;
  String? _end;
  String? _location;
  String? _driver;
  int? _tax;

  @override
  void initState() {
    super.initState();
    _start = widget.start;
    _end = widget.end;
    _location = widget.location;
    _driver = widget.driver;
    _tax = 50000;
    _model = SingletonModel.withContext(context);
    _controllerPayment = TextEditingController(text: '');
    _key = GlobalKey();
  }

  @override
  void dispose() {
    super.dispose();
    _controllerPayment.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: sizeHeight * 0.07,
              color: Colors.amber,
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
                        'Rental Detail',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 18),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            ///split kodingan mobil dipilih
            _carDetailSelected(),
            const SizedBox(
              height: 20,
            ),

            ///split kodingan informasi order
            _informationOrder(),
            const SizedBox(
              height: 70,
            ),
            InkWell(
              onTap: () {
                _summary();
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(1, 3),
                            color: Colors.black54,
                            blurRadius: 3),
                      ]),
                  child: const Center(
                    child: Text(
                      'Booking',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  ///kodingan total mobil dipilih
  Widget _carDetailSelected() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (context, index) {
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
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 190,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                  child: Text(
                                _model.addItem![index].itemMobil.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 16),
                              )),
                              Center(
                                  child: Text(
                                _model.addItem![index].itemMobil.type,
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
                                    '${_model.addItem![index].itemMobil.seat} Seat',
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
                                        .format(_model.addItem![index].itemMobil
                                            .priceDay),
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
                              _model.addItem![index].itemMobil.image,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            width: double.infinity,
                            child: Divider(
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            children: [
                              const Text('Total Item'),
                              const Spacer(),
                              SizedBox(
                                  width: 100,
                                  child: Text(
                                      '${_model.addItem![index].jumlahItem} Car')),
                            ],
                          ),
                          Row(
                            children: [
                              const Text('Sub total Price'),
                              const Spacer(),
                              SizedBox(
                                  width: 100,
                                  child: Text(NumberFormat.currency(
                                          locale: 'id',
                                          symbol: 'IDR ',
                                          decimalDigits: 0)
                                      .format(_model.addItem![index].itemMobil
                                          .subCarPrice))),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
      itemCount: _model.addItem!.length,
    );
  }

  ///kodingan informasi order
  Widget _informationOrder() {
    int subTotalPrice = 0;
    for (var element in _model.addItem!) {
      subTotalPrice += element.itemMobil.priceDay * element.jumlahItem;
      element.itemMobil.selectedCarPrice = subTotalPrice;
    }

    int totalTax = 0;
    for (var element in _model.addItem!) {
      totalTax = element.jumlahItem * _tax!;
      element.itemMobil.totalTax = totalTax;
    }

    int isTax = 0;
    for (var element in _model.addItem!) {
      isTax += element.jumlahItem * _tax!;
    }

    int totalPrice = 0;
    for (var element in _model.addItem!) {
      totalPrice += element.itemMobil.priceDay * element.jumlahItem +
          element.itemMobil.totalTax!;
      element.itemMobil.selectedCarPrice = totalPrice;
    }

    int totalItemCar = 0;
    for (var element in _model.addItem!) {
      totalItemCar += element.jumlahItem;
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Guest Information',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
          ),
          Row(
            children: const [
              Icon(
                Icons.person,
                color: Colors.amber,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Hendri',
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
          Row(
            children: const [
              Icon(
                Icons.mail,
                color: Colors.amber,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'gansusaeid@gmail.com',
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.location_pin,
                color: Colors.amber,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                _location!,
                style: const TextStyle(fontSize: 15),
              )
            ],
          ),
          const SizedBox(
            child: Divider(
              color: Colors.black,
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 8),
            child: Text(
              'Order Spesification',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
          ),
          Row(
            children: const [
              Icon(
                Icons.verified_user,
                color: Colors.amber,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Vehicle Insurance',
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
          Row(
            children: const [
              Icon(
                Icons.local_gas_station,
                color: Colors.amber,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Include BBM',
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.car_rental,
                color: Colors.amber,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                _driver!,
                style: const TextStyle(fontSize: 15),
              )
            ],
          ),
          const SizedBox(
            child: Divider(
              color: Colors.black,
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 8),
            child: Text(
              'Price Detail',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
          ),
          Row(
            children: [
              const Icon(
                Icons.directions_car,
                color: Colors.amber,
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                'Total Item',
                style: TextStyle(fontSize: 15),
              ),
              const Spacer(),
              Text('$totalItemCar Cars'),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.subject,
                color: Colors.amber,
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                'Sub Total',
                style: TextStyle(fontSize: 15),
              ),
              const Spacer(),
              Text(NumberFormat.currency(
                      locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                  .format(subTotalPrice))
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.attach_money,
                color: Colors.amber,
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                'Tax',
                style: TextStyle(fontSize: 15),
              ),
              const Spacer(),
              Text(NumberFormat.currency(
                      locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                  .format(isTax))
            ],
          ),
          const SizedBox(
            child: Divider(
              color: Colors.black,
            ),
          ),
          Row(
            children: [
              const Icon(
                Icons.money,
                color: Colors.amber,
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                'Total Price',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Text(
                NumberFormat.currency(
                        locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                    .format(totalPrice),
                style: const TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.orange),
              )
            ],
          ),
        ],
      ),
    );
  }

  ///kodingan summary
  Future _summary() {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        )),
        context: context,
        builder: (context) {
          return _summaryBottomSheed();
        });
  }

  Widget _summaryBottomSheed() {
    int totalPrice = 0;
    for (var element in _model.addItem!) {
      totalPrice += element.itemMobil.priceDay * element.jumlahItem +
          element.itemMobil.totalTax!;
      element.itemMobil.selectedCarPrice = totalPrice;
    }
    return Form(
      key: _key,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: ListView(
          physics: const ScrollPhysics(),
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: SizedBox(
                    width: 50,
                    child: Divider(
                      color: Colors.black,
                      thickness: 2,
                    ),
                  ),
                ),
                const Text(
                  'Overview',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Container(
                          height: 60,
                          width: sizeWidth * 0.45,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Start',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text('$_start')
                              ],
                            ),
                          ),
                        )),
                    const Spacer(),
                    Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Container(
                          height: 60,
                          width: sizeWidth * 0.45,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'End',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text('$_end')
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      width: sizeWidth * 0.45,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Guest Location',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_pin,
                                  color: Colors.amber,
                                ),
                                Text('$_location'),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 60,
                      width: sizeWidth * 0.45,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Guest Name',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.person,
                                  color: Colors.amber,
                                ),
                                Text('Hendri'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Total Payment',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.money,
                              color: Colors.amber,
                            ),
                            Text(
                              NumberFormat.currency(
                                      locale: 'id',
                                      symbol: ' IDR ',
                                      decimalDigits: 0)
                                  .format(totalPrice),
                              style: const TextStyle(color: Colors.orange),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _controllerPayment,
                  readOnly: true,
                  onTap: () {
                    _selectPayment();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Select Payment';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.payment, color: Colors.amber),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.grey)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      labelText: 'Payment Metode',
                      labelStyle: TextStyle(color: Colors.grey)),
                ),
                SizedBox(
                  height: sizeHeight * 0.1,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      if (_key.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PaymentWaiting()));
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.amber),
                      child: const Center(
                          child: Text(
                        'Confirm',
                        style: TextStyle(fontSize: 18),
                      )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future _selectPayment() {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: 50,
                child: Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final Payment payment = paymentMetode[index];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: InkWell(
                      onTap: () {
                        _controllerPayment.text = payment.name;
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                  offset: Offset(1, 3),
                                  color: Colors.black54,
                                  blurRadius: 4)
                            ]),
                        child: Row(
                          children: [
                            SizedBox(
                                height: 80,
                                width: 120,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(5),
                                      topLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(5),
                                      bottomLeft: Radius.circular(20)),
                                  child: Image.asset(
                                    payment.image,
                                    fit: BoxFit.cover,
                                  ),
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              payment.name,
                              style: const TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: paymentMetode.length,
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        );
      },
    );
  }
}
