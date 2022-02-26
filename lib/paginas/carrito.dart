import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_dise/constantes/constantes.dart';
import 'package:flutter_application_dise/modelo/cartera.dart';
import 'package:flutter_application_dise/paginas/Home.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class Carrito extends StatefulWidget {
  final List<objetospagados> listaObjetos;
  const Carrito({Key? key, required this.listaObjetos}) : super(key: key);

  @override
  _carritoState createState() => _carritoState();
}

class _carritoState extends State<Carrito> {
  var cargando = false;
  @override
  Widget build(BuildContext context) {
    var _screenheight = MediaQuery.of(context).size.height;
    var _screenwidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: bleu,
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.chevron_left,
                size: 40,
              ),
            ),
          ),
        ),
        body: Container(
          color: bleu,
          width: _screenwidth,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 8,
                  child: ClipPath(
                    clipper: MovieTicketClipper(),
                    child: Container(
                      color: white,
                      width: _screenwidth * .8,
                      height: _screenheight * .7,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Tienda de Vinilos',
                              style: style.copyWith(
                                  color: Colors.black, fontSize: 16),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              '\$$total',
                              maxLines: 1,
                              style: style.copyWith(
                                  color: Colors.black, fontSize: 40),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(
                              color: Colors.grey,
                              thickness: 1,
                              endIndent: 10,
                              indent: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Row(
                                children: [
                                  Text(
                                    DateTime.now().toString().substring(0, 16),
                                    style: style.copyWith(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                  const Spacer(),
                                  Text(
                                    'Visa #3246445',
                                    style: style.copyWith(
                                        fontSize: 12, color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                            const Divider(
                              color: Colors.grey,
                              indent: 10,
                              endIndent: 10,
                              thickness: 1,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Expanded(
                                flex: 2,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: widget.listaObjetos.length,
                                    itemBuilder: (context, index) {
                                      return _builditems(
                                          name:
                                              widget.listaObjetos[index].titulo,
                                          price:
                                              widget.listaObjetos[index].dinero,
                                          items:
                                              widget.listaObjetos[index].items);
                                    })),
                            const SizedBox(
                              height: 15,
                            ),
                            Expanded(
                                flex: 1,
                                child: Column(
                                  children: const [
                                    Text('www.qoubuz.com'),
                                    Text('202122'),
                                  ],
                                )),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                _buildbutton(_screenheight, _screenwidth),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded _buildbutton(double _screenheight, _screenwidth) {
    return Expanded(
      child: Container(
        width: _screenwidth * .6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: white),
        child: MaterialButton(
          onPressed: () {
            setState(() {
              cargando = true;
            });
            Future.delayed(const Duration(seconds: 3)).then((value) {
              setState(() {
                cargando = false;
              });
              _buildawesomedialog();
            });
          },
          child: (cargando)
              ? const CircularProgressIndicator()
              : Text(
                  'Paga Ahora',
                  style: style.copyWith(fontSize: 18, color: Colors.black),
                ),
        ),
      ),
    );
  }

  _buildawesomedialog() {
    return AwesomeDialog(
            context: context,
            animType: AnimType.SCALE,
            dialogType: DialogType.SUCCES,
            title: 'El pago ha sido realizado',
            btnOkText: 'Aceptar',
            btnOkIcon: Icons.check,
            dismissOnBackKeyPress: false,
            btnOkOnPress: () {
              boughtitems.clear();
              total = 0.0;
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => const Home()));
            },
            btnOkColor: Colors.green,
            buttonsBorderRadius: BorderRadius.circular(20))
        .show();
  }

  Widget _builditems(
      {required String name, required double price, required int items}) {
    return Align(
      alignment: Alignment.topCenter,
      child: Row(
        children: [
          Text(
            items > 1 ? '$name* $items' : name,
            style: style.copyWith(fontSize: 12, color: Colors.black),
          ),
          const Spacer(),
          Text(
            '\$$price',
            style: style.copyWith(fontSize: 12, color: Colors.black),
          )
        ],
      ),
    );
  }
}
