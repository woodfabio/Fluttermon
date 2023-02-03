import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:fluttermon/src/shared/models/elemtype.dart';

class EvStats {

  final String ev1name;
  final List<ElemType> ev1elemtypes;
  final List<int> ev1stats;
  
  final String ev2name;
  final List<ElemType> ev2elemtypes;
  final List<int> ev2stats;

  EvStats({    
    required this.ev1name,
    required this.ev1elemtypes,
    required this.ev1stats,
    required this.ev2name,
    required this.ev2elemtypes,
    required this.ev2stats,
  }); 

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ev1name': ev1name,
      'ev1elemtypes': ev1elemtypes.map((x) => x.toMap()).toList(),
      'ev1stats': ev1stats,
      'ev2name': ev2name,
      'ev2elemtypes': ev2elemtypes.map((x) => x.toMap()).toList(),
      'ev2stats': ev2stats,
    };
  }

  factory EvStats.fromMap(Map<String, dynamic> map) {
    return EvStats(
      ev1name: map['ev1name'] as String,
      ev1elemtypes: List<ElemType>.from((map['ev1elemtypes'] as List<int>).map<ElemType>((x) => ElemType.fromMap(x as Map<String,dynamic>),),),
      ev1stats: List<int>.from(map['ev1stats'] as List<int>),
      ev2name: map['ev2name'] as String,
      ev2elemtypes: List<ElemType>.from((map['ev2elemtypes'] as List<int>).map<ElemType>((x) => ElemType.fromMap(x as Map<String,dynamic>),),),
      ev2stats: List<int>.from(map['ev2stats'] as List<int>),
    );
  }

  String toJson() => json.encode(toMap());

  factory EvStats.fromJson(dynamic json) {
      return EvStats(
        ev1name: json['ev1name'],
        ev1elemtypes: jsonDecode(json['ev1elemtypes'])['ev1elemtypes'].map((e) => ElemType.fromMap(e)).toList(),
        ev1stats: List.from(json['ev1stats']),        
        ev2name: json['ev2name'],
        ev2elemtypes: jsonDecode(json['ev2elemtypes'])['ev2elemtypes'].map((e) => ElemType.fromMap(e)).toList(),
        ev2stats: List.from(json['ev2stats'])
      );
    }

  factory EvStats.fromJsonString(String source) => EvStats.fromMap(json.decode(source) as Map<String, dynamic>);


  EvStats copyWith({
    String? ev1name,
    List<ElemType>? ev1elemtypes,
    List<int>? ev1stats,
    String? ev2name,
    List<ElemType>? ev2elemtypes,
    List<int>? ev2stats,
  }) {
    return EvStats(
      ev1name: ev1name ?? this.ev1name,
      ev1elemtypes: ev1elemtypes ?? this.ev1elemtypes,
      ev1stats: ev1stats ?? this.ev1stats,
      ev2name: ev2name ?? this.ev2name,
      ev2elemtypes: ev2elemtypes ?? this.ev2elemtypes,
      ev2stats: ev2stats ?? this.ev2stats,
    );
  }

  @override
  String toString() {
    return 'EvStats(ev1name: $ev1name, ev1elemtypes: $ev1elemtypes, ev1stats: $ev1stats, ev2name: $ev2name, ev2elemtypes: $ev2elemtypes, ev2stats: $ev2stats)';
  }

  @override
  bool operator ==(covariant EvStats other) {
    if (identical(this, other)) return true;
  
    return 
      other.ev1name == ev1name &&
      listEquals(other.ev1elemtypes, ev1elemtypes) &&
      listEquals(other.ev1stats, ev1stats) &&
      other.ev2name == ev2name &&
      listEquals(other.ev2elemtypes, ev2elemtypes) &&
      listEquals(other.ev2stats, ev2stats);
  }

  @override
  int get hashCode {
    return ev1name.hashCode ^
      ev1elemtypes.hashCode ^
      ev1stats.hashCode ^
      ev2name.hashCode ^
      ev2elemtypes.hashCode ^
      ev2stats.hashCode;
  }
}
