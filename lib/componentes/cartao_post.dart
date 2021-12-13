import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/componentes/image_perfil.dart';
import 'package:facebook_interface/modelos/modelos.dart';
import 'package:facebook_interface/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class AreaPost extends StatelessWidget {
  final Postagem postagem;

  const AreaPost({Key? key, required this.postagem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(vertical: 8),
        child: Column(
      children: [
        //cabecalho
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //cabecalho
              CabecalhoPost(postagem: postagem),
              //descricao
              Text(postagem.descricao)
            ],
          ),
        ),

        //imagem postagem
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2),
          child: CachedNetworkImage(
            imageUrl: postagem.urlImagem,
          ),
        ),

        //area de estatisticas
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
          child: EstatisticaPost(
            postagem: postagem,
          ),
        ),

      ],
    ),
    
    );
  }
}

class EstatisticaPost extends StatelessWidget {
  final Postagem postagem;

  const EstatisticaPost({Key? key, required this.postagem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: PaletaCores.azulFacebook, shape: BoxShape.circle),
              child: Icon(
                Icons.thumb_up,
                size: 10,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 4),
            Expanded(
              child: Text(
                "${postagem.curtidas}",
                style: TextStyle(
                  color: Colors.grey[700],
                ),
              ),
            ),
            Text(
              "${postagem.comentarios} comentários",
              style: TextStyle(
                color: Colors.grey[700],
              ),
            ),
            SizedBox(width: 8),
            Text(
              "${postagem.compartilhamentos} compartilhamentos",
              style: TextStyle(
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
        Divider(
          thickness: 1.2,
        ),
        Row(
          children: [
            BotaoPost(
              icone: Icon(LineIcons.thumbsUpAlt, color: Colors.grey[700],),
              texto: "Curtir",
              onTap: (){},
              ),

             BotaoPost(
              icone: Icon(LineIcons.alternateCommentAlt, color: Colors.grey[700],),
              texto: "Comentar",
              onTap: (){}),

               BotaoPost(
              icone: Icon(LineIcons.share, color: Colors.grey[700],),
              texto: "Compartilhar",
              onTap: (){}),
          ],
        ),
      ],
    );
  }
}

class BotaoPost extends StatelessWidget {
  final Icon icone;
  final String texto;
  final VoidCallback onTap;

  const BotaoPost(
      {Key? key, required this.icone, required this.texto, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        child: InkWell(
        onTap: onTap,
        child: Container(
          child: Row(
            children: [
              icone,
              SizedBox(
                width: 4,
              ),
              Text(
              texto,
              style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
              ),
            ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}

class CabecalhoPost extends StatelessWidget {
  final Postagem postagem;

  const CabecalhoPost({Key? key, required this.postagem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImagemPerfil(
          urlImagem: postagem.usuario.urlImagem,
          foiVisualizado: true,
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                postagem.usuario.nome,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    "${postagem.tempoAtras} - ",
                  ),
                  Icon(Icons.public, size: 12, color: Colors.grey[600])
                ],
              ),
            ],
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
      ],
    );
  }
}
