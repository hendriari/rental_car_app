import 'package:flutter/material.dart';

class Destination {
  String place;
  Widget? icon;

  Destination({
    required this.place,
    this.icon,
  });
}

var placeDestination = [
  Destination(place: 'BALI', icon: Icon(Icons.location_pin, color: Colors.amber)),
  Destination(
      place: 'BALIKPAPAN', icon: Icon(Icons.location_pin, color: Colors.amber)),
  Destination(
      place: 'BANDAR LAMPUNG',
      icon: Icon(Icons.location_pin, color: Colors.amber)),
  Destination(
      place: 'BANDUNG', icon: Icon(Icons.location_pin, color: Colors.amber)),
  Destination(
      place: 'BANJARMASIN',
      icon: Icon(Icons.location_pin, color: Colors.amber)),
  Destination(place: 'DEMAK', icon: Icon(Icons.location_pin, color: Colors.amber)),
  Destination(
      place: 'JAKARTA', icon: Icon(Icons.location_pin, color: Colors.amber)),
  Destination(place: 'JAMBI', icon: Icon(Icons.location_pin, color: Colors.amber)),
  Destination(
      place: 'MAKASAR', icon: Icon(Icons.location_pin, color: Colors.amber)),
  Destination(
      place: 'MALANG', icon: Icon(Icons.location_pin, color: Colors.amber)),
  Destination(
      place: 'MANADO', icon: Icon(Icons.location_pin, color: Colors.amber)),
  Destination(
      place: 'MATARAM', icon: Icon(Icons.location_pin, color: Colors.amber)),
  Destination(place: 'MEDAN', icon: Icon(Icons.location_pin, color: Colors.amber)),
  Destination(
      place: 'PALEMBANG', icon: Icon(Icons.location_pin, color: Colors.amber)),
  Destination(
      place: 'PEKANBARU', icon: Icon(Icons.location_pin, color: Colors.amber)),
  Destination(
      place: 'SEMARANG', icon: Icon(Icons.location_pin, color: Colors.amber)),
  Destination(place: 'SOLO', icon: Icon(Icons.location_pin, color: Colors.amber)),
  Destination(
      place: 'SURABAYA', icon: Icon(Icons.location_pin, color: Colors.amber)),
  Destination(
      place: 'YOGYAKARTA', icon: Icon(Icons.location_pin, color: Colors.amber)),
];
