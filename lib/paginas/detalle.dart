import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_dise/constantes/constantes.dart';
import 'package:flutter_application_dise/modelo/vinilo.dart';

class detalle extends StatefulWidget {
  const detalle({Key? key, required this.vini}) : super(key: key);
  final Vinilo vini;
  @override
  _detalleState createState() => _detalleState();
}

class _detalleState extends State<detalle> {
  int valor = 0;
  @override
  Widget build(BuildContext context) {
    var _screenheight = MediaQuery.of(context).size.height;
    var _screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(.5),
                Colors.black.withOpacity(.0),
              ],
              begin: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              _buildupperpart(
                  screenwidth: _screenwidth, screenheight: _screenheight),
              _buildbottompart(_screenheight)
            ],
          )),
    );
  }

  Expanded _buildbottompart(double _screenheight) {
    return Expanded(
        child: Container(
      color: white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              widget.vini.titulo,
              style: style.copyWith(
                  color: Colors.black, fontSize: 40, wordSpacing: 10),
            ),
            Text(
              widget.vini.artista,
              style: style.copyWith(color: widget.vini.color, fontSize: 30),
            ),
            const SizedBox(
              height: 50,
              width: 50,
            ),
            Text(
              'Formato',
              style: style.copyWith(
                  fontWeight: FontWeight.w100,
                  fontSize: 20,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 30,
            ),
            _buildsizes(),
            const SizedBox(
              height: 30,
            ),
            _buildbutton(_screenheight)
          ],
        ),
      ),
    ));
  }

  Flexible _buildbutton(double _screenheight) {
    return Flexible(
      fit: FlexFit.loose,
      child: Container(
        height: _screenheight * .09,
        width: double.maxFinite,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: widget.vini.color),
        child: MaterialButton(
          onPressed: () {
            if (boughtitems
                .map((item) => item.titulo)
                .contains(widget.vini.titulo)) {
              final snackBar = SnackBar(
                  backgroundColor: Colors.teal,
                  duration: const Duration(seconds: 2),
                  content: Text(
                    'Ya tienes el album agregado en caja',
                    style: style.copyWith(fontSize: 14, color: Colors.white),
                  ));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else {
              boughtitems.add(
                Vinilo(
                    album: widget.vini.album,
                    artista: widget.vini.artista,
                    cantidad: widget.vini.cantidad,
                    color: widget.vini.color,
                    dinero: widget.vini.dinero,
                    foto: widget.vini.foto,
                    isselected: true,
                    titulo: widget.vini.titulo),
              );
              total = total + widget.vini.dinero;
              Navigator.pop(context);
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.backpack,
                color: white,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '¿Comprar?',
                style: style.copyWith(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildupperpart(
      {required var screenwidth, required var screenheight}) {
    return Container(
      width: screenwidth,
      height: screenheight * .6,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            widget.vini.color.withOpacity(0.9),
            Colors.black.withOpacity(.9),
          ],
          begin: Alignment.topLeft,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 70,
            ),
            Center(
              child: Image.asset(
                widget.vini.foto,
                width: 350,
                height: 350,
                colorBlendMode: BlendMode.saturation,
                fit: BoxFit.fill,
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.chevron_left,
                    color: bleu,
                    size: 40,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.vini.isselected = !widget.vini.isselected;

                      widget.vini.isselected
                          ? favouriteitems.add(widget.vini)
                          : favouriteitems.remove(widget.vini);
                    });
                  },
                  child: Icon(
                    Icons.favorite_sharp,
                    color: widget.vini.isselected ? Colors.red : white,
                    size: 30,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildsizes() {
    return SizedBox(
        height: 40,
        width: 500,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: [
            _buildsizesitem(index: 0, title: formatos[0]),
            _buildsizesitem(index: 1, title: formatos[1]),
            _buildsizesitem(index: 2, title: formatos[2]),
            _buildsizesitem(index: 3, title: formatos[3]),
            _buildsizesitem(index: 4, title: formatos[4]),
          ],
        ));
  }

  Widget _buildsizesitem({required int index, required String title}) {
    return AspectRatio(
      aspectRatio: 2.5 / 1,
      child: GestureDetector(
        onTap: () {
          setState(() {
            valor = index;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: valor == index
                ? widget.vini.color.withOpacity(0.9)
                : Colors.transparent,
          ),
          child: Center(
              child: Text(
            title.toString(),
            style: style.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w900,
              color: valor == index ? Colors.white : Colors.black,
            ),
          )),
        ),
      ),
    );
  }
}
