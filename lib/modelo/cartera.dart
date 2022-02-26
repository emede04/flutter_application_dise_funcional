// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';

class objetospagados {
  String titulo;
  String foto;
  String album;
  int items;
  double dinero;
  int tamanio;
  double cantidad;
  final Color color;

  objetospagados(
      {required this.titulo,
      required this.tamanio,
      required this.foto,
      required this.dinero,
      required this.album,
      required this.cantidad,
      required this.items,
      required this.color});
}
