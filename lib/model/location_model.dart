import 'package:flutter/material.dart';

class Location {
  String place;
  Widget? icon;

  Location({
    required this.place,
    this.icon,
  });
}

var placeLocation = [
  Location(place: 'BALI', icon: Icon(Icons.location_pin, color: Colors.amber)),
  Location(
      place: 'BALIKPAPAN', icon: Icon(Icons.location_pin, color: Colors.amber)),
  Location(
      place: 'BANDAR LAMPUNG',
      icon: Icon(Icons.location_pin, color: Colors.amber)),
  Location(
      place: 'BANDUNG', icon: Icon(Icons.location_pin, color: Colors.amber)),
  Location(
      place: 'BANJARMASIN',
      icon: Icon(Icons.location_pin, color: Colors.amber)),
  Location(place: 'DEMAK', icon: Icon(Icons.location_pin, color: Colors.amber)),
  Location(
      place: 'JAKARTA', icon: Icon(Icons.location_pin, color: Colors.amber)),
  Location(place: 'JAMBI', icon: Icon(Icons.location_pin, color: Colors.amber)),
  Location(
      place: 'MAKASAR', icon: Icon(Icons.location_pin, color: Colors.amber)),
  Location(
      place: 'MALANG', icon: Icon(Icons.location_pin, color: Colors.amber)),
  Location(
      place: 'MANADO', icon: Icon(Icons.location_pin, color: Colors.amber)),
  Location(
      place: 'MATARAM', icon: Icon(Icons.location_pin, color: Colors.amber)),
  Location(place: 'MEDAN', icon: Icon(Icons.location_pin, color: Colors.amber)),
  Location(
      place: 'PALEMBANG', icon: Icon(Icons.location_pin, color: Colors.amber)),
  Location(
      place: 'PEKANBARU', icon: Icon(Icons.location_pin, color: Colors.amber)),
  Location(
      place: 'SEMARANG', icon: Icon(Icons.location_pin, color: Colors.amber)),
  Location(place: 'SOLO', icon: Icon(Icons.location_pin, color: Colors.amber)),
  Location(
      place: 'SURABAYA', icon: Icon(Icons.location_pin, color: Colors.amber)),
  Location(
      place: 'YOGYAKARTA', icon: Icon(Icons.location_pin, color: Colors.amber)),
];
