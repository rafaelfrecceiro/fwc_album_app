import 'dart:convert';

class UserStickersModel {
  final int id;
  final int idUser;
  final int idSticker;
  final int duplicate;
  final String stickerCode;
  final String stickerNumber;

  UserStickersModel({
    required this.id,
    required this.idUser,
    required this.idSticker,
    required this.duplicate,
    required this.stickerCode,
    required this.stickerNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'id_user': idUser,
      'id_sticker': idSticker,
      'duplicate': duplicate,
      'sticker_code': stickerCode,
      'sticker_number': stickerNumber,
    };
  }

  factory UserStickersModel.fromMap(Map<String, dynamic> map) {
    return UserStickersModel(
      id: map['id']?.toInt() ?? 0,
      idUser: map['id_user']?.toInt() ?? 0,
      idSticker: map['id_sticker']?.toInt() ?? 0,
      duplicate: map['duplicate']?.toInt() ?? 0,
      stickerCode: map['sticker_code'] ?? '',
      stickerNumber: map['sticker_number'] ?? '',
    );
  }

  String toJson() => jsonEncode(toMap());

  factory UserStickersModel.fromJson(String source) =>
      UserStickersModel.fromMap(jsonDecode(source));
}
