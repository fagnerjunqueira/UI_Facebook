import 'package:facebook_interface/componentes/abasDesktop.dart';
import 'package:facebook_interface/componentes/navegacao_barras.dart';
import 'package:facebook_interface/dados/usuarios.dart';
import 'package:facebook_interface/telas/home.dart';
import 'package:facebook_interface/uteis/responsivo.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Principal extends StatefulWidget {
  const Principal({ Key? key }) : super(key: key);

  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {

  final List<Widget> _telas = [
    Home(),
    Scaffold(
      backgroundColor: Colors.purple,
    ),
    Scaffold(
      backgroundColor: Colors.green,
    ),
    Scaffold(
      backgroundColor: Colors.red,
    ),
    Scaffold(
      backgroundColor: Colors.blue,
    ),
    Scaffold(
      backgroundColor: Colors.orange,
    ),
  ];

  List<IconData> _icones = [
    Icons.home,
    Icons.ondemand_video,
    Icons.storefront_outlined,
    Icons.flag_outlined,
    LineIcons.bell,
    Icons.menu
  ];

  int _indiceAbaSelecionada = 0;

  @override
  Widget build(BuildContext context) {

    final bool isDesktop = Responsivo.isDesktop(context);
    Size tamanho = MediaQuery.of(context).size;

    return DefaultTabController(
      length: _icones.length,
      child: Scaffold(
        appBar: isDesktop 
        ? PreferredSize(
          child: NavegacaoAbasDesktop(
            usuario: usuarioAtual,
            icones: _icones,
          indiceAbaSelecionada: _indiceAbaSelecionada,
          ontap: (indice){
            setState(() {
              _indiceAbaSelecionada = indice;
            });
          },
          ),
          preferredSize: Size(tamanho.width,100),
        )
        : null,
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: _telas,
        ),
        bottomNavigationBar: isDesktop ? null : NavegacaoInf(
          icones: _icones,
          indiceAbaSelecionada: _indiceAbaSelecionada,
          ontap: (indice){
            setState(() {
              _indiceAbaSelecionada = indice;
            });
          },
          indicadorEmabaixo: false,
        ),
      )
      );
  }
}