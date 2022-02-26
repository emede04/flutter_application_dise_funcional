// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_application_dise/modelo/vinilo.dart';
import 'package:google_fonts/google_fonts.dart';

final TextStyle style = GoogleFonts.lato(
    fontSize: 30, color: Colors.white, fontWeight: FontWeight.w700);
const Color bleu = Color(0xFF148BFF);
const Color red = Color(0xFFC3011B);
const Color white = Color(0xFFDCDBEB);
List<Vinilo> todoslosalbums = [
  Vinilo(
      titulo: 'Art Pop',
      album: 'ArtPop',
      artista: 'Lady Gaga',
      cantidad: 12,
      dinero: 23,
      foto: "assets/images/artpop.jpg",
      isselected: true,
      color: Colors.pink),
  Vinilo(
      titulo: 'Depression Cherry',
      album: 'Depression Cherry',
      artista: 'Beach House',
      cantidad: 12,
      dinero: 32,
      foto: "assets/images/depresion.jpg",
      isselected: true,
      color: Colors.deepOrangeAccent.shade700),
  Vinilo(
      titulo: 'Chip Chrome & the Mono-Tones ',
      album: 'Chip Chrome & the Mono-Tones ',
      artista: 'The Neighbourhood',
      cantidad: 12,
      dinero: 43,
      foto: "assets/images/chip.png",
      isselected: true,
      color: Colors.teal.shade700),
  Vinilo(
      titulo: 'In Utero',
      album: 'In Utero',
      artista: 'Nirvana',
      cantidad: 12,
      dinero: 60,
      foto: "assets/images/inutero.jpg",
      isselected: true,
      color: Colors.amber.shade900),
];

List<Vinilo> albums_mas_vendidos = [
  Vinilo(
      titulo: 'Spiderland',
      album: 'Spiderland',
      artista: 'Slint',
      cantidad: 12,
      dinero: 100,
      foto: "assets/images/slint.jpg",
      isselected: true,
      color: Colors.black),
  Vinilo(
      titulo: 'Ultraviolence',
      album: 'Ultraviolence',
      artista: 'Lana Del Rey',
      cantidad: 12,
      dinero: 60,
      foto: "assets/images/ultraviolence.jpg",
      isselected: true,
      color: Colors.grey.shade900),
  Vinilo(
      titulo: 'Chelsea Girl',
      album: 'Chelsea Girl',
      artista: 'Nico',
      cantidad: 12,
      dinero: 140,
      foto: "assets/images/nico.jpg",
      isselected: true,
      color: Colors.teal.shade900),
  Vinilo(
      titulo: 'The Velvet Underground & Nico 45th Anniversary ',
      album: 'The Velvet Underground',
      artista: 'The Velvet Underground',
      cantidad: 12,
      dinero: 40,
      foto: "assets/images/velvet.png",
      isselected: true,
      color: Colors.yellow.shade700),
  Vinilo(
      titulo: 'Descanso En Poder',
      album: 'Descanso En Poder',
      artista: 'DELLAFUENTE',
      cantidad: 12,
      dinero: 40,
      foto: "assets/images/dela.png",
      isselected: true,
      color: Colors.lightBlue.shade200),
  Vinilo(
      titulo: 'Norman Fucking Rockwell!',
      album: 'Norman Fucking Rockwell!',
      artista: 'Lana Del Rey',
      cantidad: 12,
      dinero: 60,
      foto: "assets/images/norman.png",
      isselected: true,
      color: Color.fromARGB(255, 28, 144, 190)),
];

List<Vinilo> top_10_POP = [
  Vinilo(
      titulo: 'My First Album',
      album: 'My First Album',
      artista: 'Peppa Pig',
      cantidad: 12,
      dinero: 60,
      foto: "assets/images/peppa.jpg",
      isselected: true,
      color: Colors.yellow.shade900),
  Vinilo(
      titulo: 'Much Against Everyone’s Advice ',
      album: 'Much Against Everyone’s Advice',
      artista: 'Soulwax',
      cantidad: 12,
      dinero: 60,
      foto: "assets/images/advice.jpg",
      isselected: true,
      color: Colors.tealAccent.shade700),
];

List<Vinilo> todos = albums_mas_vendidos + top_10_POP + todoslosalbums;

List formatos = ["VINILO", "DIGITAL", "CASSETE", "CD", "MARIACHI"];

List<Vinilo> boughtitems = [];
List<Vinilo> favouriteitems = [];

double total = 0.00;
