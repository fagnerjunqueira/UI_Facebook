import 'package:facebook_interface/componentes/botaoPerfil.dart';
import 'package:facebook_interface/modelos/modelos.dart';
import 'package:facebook_interface/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class ListaOpcoes extends StatelessWidget {
  final Usuario usuario;
  final List<List> _opcoes = const [
    [LineIcons.userFriends, PaletaCores.azulFacebook, "Amigos"],
    [LineIcons.facebookMessenger, PaletaCores.azulFacebook, "Mensagens"],
    [LineIcons.flag, PaletaCores.azulFacebook, "Páginas"],
    [LineIcons.users, PaletaCores.azulFacebook, "Grupos"],
    [Icons.storefront_outlined, PaletaCores.azulFacebook, "Marktplace"],
    [Icons.ondemand_video, PaletaCores.azulFacebook, "Assistir"],
    [LineIcons.calendar, PaletaCores.azulFacebook, "Eventos"],
    [LineIcons.chevronCircleDown, PaletaCores.azulFacebook, "Ver mais"],
  ];

  const ListaOpcoes({
    Key? key,
    required this.usuario,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10),
          itemCount: 1 + _opcoes.length,
          itemBuilder: (context, indice) {

            if(indice == 0){
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: BotaoImagemPerfil(usuario: usuario, ontap: (){},),
                );
            }

            List item = _opcoes[indice - 1];
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Opcao(
                icone: item[0],
                color: item[1],
                texto: item[2],
                onTap: (){},
              ),
            );
          }),
    );
  }
}

class Opcao extends StatelessWidget {

  final IconData icone;
  final Color color;
  final String texto;
  final VoidCallback onTap;

  const Opcao({
    Key? key,
    required this.color,
    required this.icone,
    required this.texto,
    required this.onTap
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icone, color: color, size: 35,),
          SizedBox(width: 4,),
          Flexible(child: Text(texto,style: TextStyle(
            fontSize: 16
          ),
          overflow: TextOverflow.ellipsis,
          ))
        ],
      ),
    );
  }
}