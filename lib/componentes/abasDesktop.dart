import 'package:facebook_interface/componentes/botaoPerfil.dart';
import 'package:facebook_interface/modelos/modelos.dart';
import 'package:facebook_interface/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'botao_circulo.dart';
import 'navegacao_barras.dart';

class NavegacaoAbasDesktop extends StatelessWidget {

  final Usuario usuario;
  final List<IconData> icones;
  final int indiceAbaSelecionada;
  final Function(int) ontap;

  const NavegacaoAbasDesktop({
    Key? key,
    required this.usuario,
    required this.icones,
    required this.indiceAbaSelecionada,
    required this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
          color: Colors.black12,
          offset: Offset(0,2),
          blurRadius: 4,
        )
        ]
      ),
      child: Row(children: [
        Expanded(child: Text(
              "facebook",
              style: TextStyle(
                color: PaletaCores.azulFacebook,
                fontWeight: FontWeight.bold,
                fontSize: 32,
                letterSpacing: -1.2
              ),
            ),
        
        ),
        Expanded(child: NavegacaoInf(
          icones: icones,
          indiceAbaSelecionada: indiceAbaSelecionada,
          ontap: ontap,
          indicadorEmabaixo: true,
        ),
        
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BotaoImagemPerfil(
                usuario: usuario,
                ontap: () {
                  
                },
              ),
              BotaoCirculo(
                  icone: Icons.search,
                  iconeTamanho: 30,
                  onPressed: (){}
                  ),

              BotaoCirculo(
                  icone: LineIcons.facebookMessenger,
                  iconeTamanho: 30,
                  onPressed: (){}
                  ),
            ],
          )
          ),
      ],),
    );
  }
}