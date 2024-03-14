import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sneakers_animation/data/model/shoe.dart';

class ShoeRepository {
  Future<List<Shoe>> loadShoe(
      {String filePath = "assets/men_shoes.json"}) async {
    final response = await rootBundle.loadString(filePath);
    final shoe =
        (jsonDecode(response) as List).map((e) => Shoe.fromJson(e)).toList();
    return shoe;
  }
}

final repositoryProvider = Provider<ShoeRepository>((ref) {
  return ShoeRepository();
});

final shoeProvider = FutureProvider<List<Shoe>>((ref) async {
  return ref.watch(repositoryProvider).loadShoe();
});
