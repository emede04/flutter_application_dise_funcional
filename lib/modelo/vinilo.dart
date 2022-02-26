import 'package:flutter/cupertino.dart';

class Vinilo {
  String titulo;
  String artista;
  String foto;
  String album;
  bool isselected;
  double dinero;
  double cantidad;
  final Color color;

  Vinilo(
      {required this.titulo,
      required this.artista,
      required this.foto,
      required this.dinero,
      required this.album,
      required this.cantidad,
      required this.isselected,
      required this.color});
}
