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
  Destination(place: 'BALI', icon: const Icon(Icons.location_pin, color: Colors.amber)),
  Destination(
      place: 'BALIKPAPAN', icon: const Icon(Icons.location_pin, color: Colors.amber)),
  Destination(
      place: 'BANDAR LAMPUNG',
      icon: const Icon(Icons.location_pin, color: Colors.amber)),
  Destination(
      place: 'BANDUNG', icon: const Icon(Icons.location_pin, color: Colors.amber)),
  Destination(
      place: 'BANJARMASIN',
      icon: const Icon(Icons.location_pin, color: Colors.amber)),
  Destination(place: 'DEMAK', icon: const Icon(Icons.location_pin, color: Colors.amber)),
  Destination(
      place: 'JAKARTA', icon: const Icon(Icons.location_pin, color: Colors.amber)),
  Destination(place: 'JAMBI', icon: const Icon(Icons.location_pin, color: Colors.amber)),
  Destination(
      place: 'MAKASAR', icon: const Icon(Icons.location_pin, color: Colors.amber)),
  Destination(
      place: 'MALANG', icon: const Icon(Icons.location_pin, color: Colors.amber)),
  Destination(
      place: 'MANADO', icon: const Icon(Icons.location_pin, color: Colors.amber)),
  Destination(
      place: 'MATARAM', icon: const Icon(Icons.location_pin, color: Colors.amber)),
  Destination(place: 'MEDAN', icon: const Icon(Icons.location_pin, color: Colors.amber)),
  Destination(
      place: 'PALEMBANG', icon: const Icon(Icons.location_pin, color: Colors.amber)),
  Destination(
      place: 'PEKANBARU', icon: const Icon(Icons.location_pin, color: Colors.amber)),
  Destination(
      place: 'SEMARANG', icon: const Icon(Icons.location_pin, color: Colors.amber)),
  Destination(place: 'SOLO', icon: const Icon(Icons.location_pin, color: Colors.amber)),
  Destination(
      place: 'SURABAYA', icon: const Icon(Icons.location_pin, color: Colors.amber)),
  Destination(
      place: 'YOGYAKARTA', icon: const Icon(Icons.location_pin, color: Colors.amber)),
];
