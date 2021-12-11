import 'package:facebook_interface/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';

class NavegacaoInf extends StatelessWidget {

  final List<IconData> icones;
  final int indiceAbaSelecionada;
  final Function(int) ontap;
  final bool indicadorEmabaixo;

  const NavegacaoInf({
    Key? key,
    required this.icones,
    required this.indiceAbaSelecionada,
    required this.ontap,
    required this.indicadorEmabaixo
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: ontap,
      indicator: BoxDecoration(
        border: indicadorEmabaixo 
        ? Border(
          bottom: BorderSide(
            color: PaletaCores.azulFacebook,
            width: 3,
          )
        )
        : Border(
          top: BorderSide(
            color: PaletaCores.azulFacebook,
            width: 3,
          )
        )
      ),
      tabs: icones.asMap().map((indice,icone){
        return MapEntry(indice, Tab(
          icon: Icon(
            icone,
            color: indiceAbaSelecionada == indice ? PaletaCores.azulFacebook : Colors.black54,
            size: 30,
            ),
        )
        );
      }).values.toList()
      );
  }
}