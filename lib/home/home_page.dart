import 'package:flutter/material.dart';
import 'package:rent_app/home/bus_rent/bus_page.dart';
import 'package:rent_app/model/popular_page.dart';
import 'package:rent_app/model/promo_model.dart';
import 'package:rent_app/home/car_rent/rent_car_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: sizeHeight * 0.1,
                color: Colors.amber,
                width: sizeWidth,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 10.0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  const [
                      SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('images/boruto.png'),
                      )
                      ],
                  ),
                )),
            Container(
              height: 90,
              width: sizeWidth,
              decoration: const BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(70),
                      bottomLeft: Radius.circular(70))),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Hallo, Hendri',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 24),
                    ),
                    Text(
                      'Good Morning',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 24),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: sizeWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 8, 0, 0),
                    child: SizedBox(
                      height: 20,
                      child: Text('Services'),
                    ),
                  ),
                  //kodingan service
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const RentPage()));
                            },
                            child: Container(
                              height: 70,
                              width: sizeWidth * 0.45,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black54,
                                        offset: Offset(1, 3),
                                        blurRadius: 3)
                                  ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.directions_car,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Rent Car',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),

                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const BusPage()));
                            },
                            child: Container(
                              height: 70,
                              width: sizeWidth * 0.45,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black54,
                                        offset: Offset(1, 3),
                                        blurRadius: 3)
                                  ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.directions_car,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Rent Bus',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: SizedBox(
                      height: 20,
                      child: Text('Popular Rent'),
                    ),
                  ),
                  //kodingan popular rental
                  _popularRent(),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: SizedBox(
                      height: 20,
                      child: Text('Promotion'),
                    ),
                  ),
                  _promo(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _popularRent() {
    return SizedBox(
      height: 160,
      width: double.infinity,
      child: ListView.builder(
        physics: const ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final PopularRental populer = popularRental[index];
          return Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Stack(
              children: [
                Align(
                  child: Container(
                    height: 150,
                    width: 230,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black54,
                            offset: Offset(1, 2),
                            blurRadius: 3)
                      ],
                    ),
                    child: InkResponse(
                      onTap: () {},
                      child: Stack(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                populer.image,
                                fit: BoxFit.cover,
                                height: double.infinity,
                                width: double.infinity,
                              )),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Container(
                                height: 20,
                                decoration: const BoxDecoration(
                                    color: Colors.black38,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20))),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    populer.name,
                                    style: const TextStyle(color: Colors.amber),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: popularRental.length,
      ),
    );
  }

  Widget _promo() {
    return SizedBox(
      height: 160,
      width: double.infinity,
      child: ListView.builder(
        physics: const ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final Promo promo = promosi[index];
          return Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Stack(
              children: [
                Align(
                  child: Container(
                    height: 150,
                    width: 230,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black54,
                            offset: Offset(1, 2),
                            blurRadius: 3)
                      ],
                    ),
                    child: InkResponse(
                      onTap: () {},
                      child: Stack(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                promo.image,
                                fit: BoxFit.cover,
                                height: double.infinity,
                                width: double.infinity,
                              )),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Container(
                                height: 20,
                                decoration: const BoxDecoration(
                                    color: Colors.black38,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20))),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    promo.name,
                                    style: const TextStyle(color: Colors.amber),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: promosi.length,
      ),
    );
  }
}
