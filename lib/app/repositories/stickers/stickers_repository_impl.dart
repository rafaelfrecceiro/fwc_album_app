import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fwc_album_app/app/core/exceptions/repository_exceptions.dart';
import 'package:fwc_album_app/app/core/rest/custom_dio.dart';
import 'package:fwc_album_app/app/models/group_stickers_model.dart';
import 'package:fwc_album_app/app/repositories/stickers/stickers_repository.dart';

class StickersRepositoryImpl implements StickersRepository {
  final CustomDio dio;

  StickersRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<GroupStickersModel>> getMyAlbum() async {
    try {
      final result = await dio.auth().get('/api/countries');
      return result.data
          .map<GroupStickersModel>((g) => GroupStickersModel.fromMap(g))
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar álbum do usuário', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar álbum do usuário');
    }
  }
}
