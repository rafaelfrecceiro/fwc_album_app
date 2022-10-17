// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';
import 'package:fwc_album_app/app/models/user_sticker_model.dart';

class GroupStickersModel {
  final int id;
  final String countryCode;
  final String countryName;
  final int stickersStart;
  final int stickersEnd;
  final List<UserStickersModel> stickers;
  final String flag;

  GroupStickersModel({
    required this.id,
    required this.countryCode,
    required this.countryName,
    required this.stickersStart,
    required this.stickersEnd,
    required this.stickers,
    required this.flag,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'countryCode': countryCode,
      'country_name': countryName,
      'stickers_start': stickersStart,
      'stickers_end': stickersEnd,
      'stickers': stickers.map((x) => x.toMap()).toList(),
      'flag': flag,
    };
  }

  factory GroupStickersModel.fromMap(Map<String, dynamic> map) {
    log(map.toString());
    return GroupStickersModel(
      id: map['id'] as int,
      countryCode: map['country_code'] as String,
      countryName: map['country_name'] as String,
      stickersStart: map['stickers_start'] as int,
      stickersEnd: map['stickers_end'] as int,
      stickers: List<UserStickersModel>.from((map['stickers'])
          .map<UserStickersModel>(
              (x) => UserStickersModel.fromMap(x as Map<String, dynamic>))),
      flag: map['flag'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GroupStickersModel.fromJson(String source) =>
      GroupStickersModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
