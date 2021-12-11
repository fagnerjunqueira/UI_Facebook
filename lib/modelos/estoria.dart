import 'package:facebook_interface/modelos/modelos.dart';

class Estoria {
  Usuario usuario;

  String urlImagem;
  bool storyVisto;

  Estoria({
    required this.usuario,
    required this.urlImagem,
    this.storyVisto = false,
  });
}