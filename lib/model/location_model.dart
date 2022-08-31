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
  Location(place: 'BALI', icon: const Icon(Icons.location_pin, color: Colors.amber)),
  Location(
      place: 'BALIKPAPAN', icon: const Icon(Icons.location_pin, color: Colors.amber)),
  Location(
      place: 'BANDAR LAMPUNG',
      icon: const Icon(Icons.location_pin, color: Colors.amber)),
  Location(
      place: 'BANDUNG', icon: const Icon(Icons.location_pin, color: Colors.amber)),
  Location(
      place: 'BANJARMASIN',
      icon: const Icon(Icons.location_pin, color: Colors.amber)),
  Location(place: 'DEMAK', icon: const Icon(Icons.location_pin, color: Colors.amber)),
  Location(
      place: 'JAKARTA', icon: const Icon(Icons.location_pin, color: Colors.amber)),
  Location(place: 'JAMBI', icon: const Icon(Icons.location_pin, color: Colors.amber)),
  Location(
      place: 'MAKASAR', icon: const Icon(Icons.location_pin, color: Colors.amber)),
  Location(
      place: 'MALANG', icon: const Icon(Icons.location_pin, color: Colors.amber)),
  Location(
      place: 'MANADO', icon: const Icon(Icons.location_pin, color: Colors.amber)),
  Location(
      place: 'MATARAM', icon: const Icon(Icons.location_pin, color: Colors.amber)),
  Location(place: 'MEDAN', icon: const Icon(Icons.location_pin, color: Colors.amber)),
  Location(
      place: 'PALEMBANG', icon: const Icon(Icons.location_pin, color: Colors.amber)),
  Location(
      place: 'PEKANBARU', icon: const Icon(Icons.location_pin, color: Colors.amber)),
  Location(
      place: 'SEMARANG', icon: const Icon(Icons.location_pin, color: Colors.amber)),
  Location(place: 'SOLO', icon: const Icon(Icons.location_pin, color: Colors.amber)),
  Location(
      place: 'SURABAYA', icon: const Icon(Icons.location_pin, color: Colors.amber)),
  Location(
      place: 'YOGYAKARTA', icon: const Icon(Icons.location_pin, color: Colors.amber)),
];
