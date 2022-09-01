import 'package:flutter/material.dart';
import 'package:rent_app/home/bus_rent/bus_catalog.dart';
import 'package:rent_app/model/destination_bus_model.dart';
import 'package:rent_app/model/location_model.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class BusPage extends StatefulWidget {
  const BusPage({Key? key}) : super(key: key);

  @override
  State<BusPage> createState() => _BusPageState();
}

class _BusPageState extends State<BusPage> {
  late TextEditingController _textController;
  late TextEditingController _destinationtextController;
  late GlobalKey<FormState> _key;
  late double sizeHeight = MediaQuery.of(context).size.height;
  late double sizeWidth = MediaQuery.of(context).size.width;
  String? _start;
  String? _end;
  double? _setHeight;
  double? _sizeboxHeight;

  @override
  void initState() {
    super.initState();
    _start = '';
    _end = '';
    _setHeight = 280;
    _sizeboxHeight = 200;
    _key = GlobalKey();
    _textController = TextEditingController(text: '');
    _destinationtextController = TextEditingController(text: '');
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _start = DateFormat('E, d MMMM yyyy').format(args.value.startDate);
        _end = DateFormat('E, d MMMM yyyy')
            .format(args.value.endDate ?? args.value.startDate);
      } else if (args.value is DateTime) {
        _start = args.value.toString();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
    _destinationtextController.dispose();
  }

  void setHeightContainer() {
    if (_start != null && _end != null) {
      _setHeight = 390;
      _sizeboxHeight = 90;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: sizeHeight * 0.07,
              color: Colors.amber,
              width: sizeWidth,
            ),
            Container(
              height: 40,
              width: sizeWidth,
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
                        'Rental',
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
              height: 30,
            ),
            Center(
              child: Form(
                key: _key,
                child: Container(
                  height: _setHeight,
                  width: sizeWidth * 0.8,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(1, 3),
                          color: Colors.black54,
                          blurRadius: 3,
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _location(),
                        const SizedBox(height: 8),
                        _selectdestination(),
                        const SizedBox(height: 8),
                        _date(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: _sizeboxHeight,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  if (_key.currentState!.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BusCatalog(
                                  end: _end,
                                  start: _start,
                                  location: _textController.text,
                                  destination: _destinationtextController.text,
                                )));
                  } else {
                    setState(() {
                      setHeightContainer();
                    });
                  }
                },
                child: Container(
                  height: 50,
                  width: sizeWidth * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(1, 3),
                        color: Colors.black38,
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'Search',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  ///kodingan pilih lokasi
  Widget _location() {
    return TextFormField(
      controller: _textController,
      readOnly: true,
      onTap: () {
        _selectLocation();
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please Select Location';
        }
        return null;
      },
      decoration: const InputDecoration(
          prefixIcon: Icon(Icons.location_pin, color: Colors.amber),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Colors.amber)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.amber),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          labelText: 'Location',
          labelStyle: TextStyle(color: Colors.amber)),
    );
  }

  Future _selectLocation() {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  width: 50,
                  child: Divider(
                    color: Colors.black,
                    thickness: 2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    cursorColor: Colors.amber,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.location_pin, color: Colors.amber),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.amber)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      labelText: 'Select Location',
                      labelStyle: TextStyle(color: Colors.amber),
                    ),
                  ),
                ),
                ListView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final Location location = placeLocation[index];
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                          child: InkWell(
                            onTap: () {
                              _textController.text = location.place;
                              Navigator.pop(context);
                            },
                            child: Row(
                              children: [
                                SizedBox(child: location.icon),
                                const SizedBox(width: 10),
                                Text(location.place),
                              ],
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Divider(
                            color: Colors.black,
                          ),
                        )
                      ],
                    );
                  },
                  itemCount: placeLocation.length,
                ),
                const SizedBox(
                  height: 40,
                  child: Center(
                    child: Text(
                      'No more data',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  ///kodingan tanggal
  Widget _date() {
    return Column(
      children: [
        TextFormField(
          controller: TextEditingController(text: _start),
          readOnly: true,
          onTap: () {
            _selectDate();
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'must be filled';
            }
            return null;
          },
          decoration: const InputDecoration(
              prefixIcon:
                  Icon(Icons.calendar_month_outlined, color: Colors.amber),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.amber)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              labelText: 'Start',
              labelStyle: TextStyle(color: Colors.amber)),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: TextEditingController(text: _end),
          readOnly: true,
          onTap: () {
            _selectDate();
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'must be filled';
            }
            return null;
          },
          decoration: const InputDecoration(
              prefixIcon:
                  Icon(Icons.calendar_month_outlined, color: Colors.amber),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.amber)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              labelText: 'End',
              labelStyle: TextStyle(color: Colors.amber)),
        )
      ],
    );
  }

  Future _selectDate() {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                width: 50,
                child: Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: SfDateRangePicker(
                  selectionTextStyle: const TextStyle(fontFamily: 'Ubuntu'),
                  rangeTextStyle: const TextStyle(
                      fontFamily: 'Ubuntu', color: Colors.green),
                  todayHighlightColor: Colors.amber,
                  startRangeSelectionColor: Colors.amber,
                  endRangeSelectionColor: Colors.amber,
                  rangeSelectionColor: Colors.amber.withOpacity(0.2),
                  onSelectionChanged: _onSelectionChanged,
                  selectionMode: DateRangePickerSelectionMode.range,
                  initialSelectedRange: PickerDateRange(
                      DateTime.now().subtract(const Duration(days: 0)),
                      DateTime.now().add(const Duration(days: 0))),
                ),
              ),
            ],
          );
        });
  }

  ///kodingan destinasi
  Widget _selectdestination() {
    return TextFormField(
      controller: _destinationtextController,
      readOnly: true,
      onTap: () {
        _destination();
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Destination ?';
        }
        return null;
      },
      decoration: const InputDecoration(
          prefixIcon: Icon(Icons.location_pin, color: Colors.amber),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Colors.amber)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.amber),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          labelText: 'Destination',
          labelStyle: TextStyle(color: Colors.amber)),
    );
  }

  Future _destination() {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  width: 50,
                  child: Divider(
                    color: Colors.black,
                    thickness: 2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    cursorColor: Colors.amber,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.location_pin, color: Colors.amber),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.amber)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      labelText: 'Select Destination',
                      labelStyle: TextStyle(color: Colors.amber),
                    ),
                  ),
                ),
                ListView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final Destination destinasi = placeDestination[index];
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                          child: InkWell(
                            onTap: () {
                              _destinationtextController.text = destinasi.place;
                              Navigator.pop(context);
                            },
                            child: Row(
                              children: [
                                SizedBox(child: destinasi.icon),
                                const SizedBox(width: 10),
                                Text(destinasi.place),
                              ],
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Divider(
                            color: Colors.black,
                          ),
                        )
                      ],
                    );
                  },
                  itemCount: placeDestination.length,
                ),
                const SizedBox(
                  height: 40,
                  child: Center(
                    child: Text(
                      'No more data',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
