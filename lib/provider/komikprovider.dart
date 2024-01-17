import 'package:flutter/material.dart';
import 'package:aaaaaaa/model/komikmodel.dart';

class KomikProvider with ChangeNotifier {
  final List<KomikModel> listModel;

  KomikProvider({required this.listModel});

  void toggleFavoriteStatus(KomikModel komikModel) {
    komikModel.isFavorite = !komikModel.isFavorite;
    notifyListeners();
  }
}