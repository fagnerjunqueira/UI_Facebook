import 'package:facebook_interface/componentes/image_perfil.dart';
import 'package:facebook_interface/modelos/usuario.dart';
import 'package:flutter/material.dart';

class BotaoImagemPerfil extends StatelessWidget {

  final Usuario usuario;
  final VoidCallback ontap;

  const BotaoImagemPerfil({
    Key? key,
    required this.usuario,
    required this.ontap,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ImagemPerfil(urlImagem: usuario.urlImagem, foiVisualizado: true,),
          SizedBox(width: 4,),
          Flexible(child: Text(usuario.nome,style: TextStyle(
            fontSize: 16
          ),
          overflow: TextOverflow.ellipsis,
          ))
        ],
      ),
    );
  }
}