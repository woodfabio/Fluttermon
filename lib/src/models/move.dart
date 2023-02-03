import 'dart:convert';
import 'package:fluttermon/src/models/elemtype.dart';
import 'package:fluttermon/src/models/pokemon.dart';

class Move {
  String name;
  ElemType elemType;  // type number id:
                                    // -1 = none
                                    // 0 = normal
                                    // 1 = grass
                                    // 2 = fire
                                    // 3 = water
                                    // 4 = electric
                                    // 5 = poison
                                    // 6 = flying
                                    // 7 = Dragon
  int power;
  int pp;    // power points - each usage spends 1 pp
  int curPp; // current power points

  // constructor method
  Move({
    this.name = '-',
    required this.elemType,
    this.power = 0,
    this.pp = 0,
    this.curPp = 0,
  });
    
  // getter and setter methods
  String getName() {      
    return name;
  }
  
  void setName(String name) {
    this.name = name;
  }
  
  ElemType getType() {
    return elemType;
  }
  
  void setType(ElemType type) {
    elemType = type;
  }
  
  int getPower() {
    return power;
  }
  
  void setPower(int power) {
    this.power = power;
  }
  
  int getPp() {
    return pp;
  }
  
  void setPp(int pp) {
    this.pp = pp;
  }
  
  int getCurPp() {
    return pp;
  }
  
  void setCurPp(int pp) {
    this.pp = pp;
  }
    
  // show method
    /*
    get showMove {
      if (name == '-') {
        return getName();
      } else {
        Text("(" + this.getType().name + ") " + this.getName());
        System.out.println("Power: " + this.power);
        System.out.println("Pp: " + this.curPp + "/" + this.pp);
      }
    }
    */
    
  // effectiveness method
  double effect(Pokemon def) {
    double eff = 1; // effectiveness
    double eff2 = 1;
      switch (elemType.id) { // move type
        case 1: // grass move
          switch (def.elemType1!.id) {
            case 1: // grass
              if (def.elemType2!.id != -1) {
                switch (def.elemType2!.id) {
                  case 2: // fire
                    eff2 = 2;
                    break;
                  case 3: // water
                    eff2 = 0.5;
                    break;
                  default:
                    break;
                }
              }
              eff = 0.5/eff2;
              break;
            case 2:  // fire
              if (def.elemType2!.id != -1) {
                switch (def.elemType2!.id) {
                  case 3: // water
                    eff2 = 0.5;
                    break;
                  case 4: // grass
                    eff2 = 2;
                    break;
                  default:
                    break;
                }
              }
            eff = 0.5/eff2;
            break;
            case 3:  // water
              if (def.elemType2!.id != -1) {
                switch (def.elemType2!.id) {
                  case 1: // grass
                    eff2 = 2;
                    break;
                  case 2: // fire
                    eff2 = 2;
                    break;
                  default:
                    break;
                }
              }
              eff = 2/eff2;
              break;
          }
          break;
        case 2: // fire move
          switch (def.elemType1!.id) {
            case 1:  // grass
              if (def.elemType2!.id != -1) {
                switch (def.elemType2!.id) {
                  case 2: // fire
                    eff2 = 2;
                    break;
                  case 3: // water
                    eff2 = 2;
                    break;
                  default:
                    break;
                }
              }
              eff = 2/eff2;
              break;
            case 2:  // fire    
              if (def.elemType2!.id != -1) {                      
                switch (def.elemType2!.id) {
                  case 1: // grass
                    eff2 = 0.5;
                    break;
                  case 3: // water
                    eff2 = 2;
                      break;
                  default:
                    break;
                }
              }
              eff = 0.5/eff2;
              break;
            case 3: // water
              if (def.elemType2!.id != -1) {
                switch (def.elemType2!.id) {
                  case 1: // grass
                    eff2 = 0.5;
                    break;
                  case 2: // fire
                    eff2 = 2;
                    break;
                  default:
                    break;
                }
              }
              eff = 0.5/eff2;
              break;
          }
          break;
        case 3: // water move
          switch (def.elemType1!.id) {
            case 1:  // grass
              if (def.elemType2!.id != -1) {
                switch (def.elemType2!.id) {
                  case 2: // fire
                    eff2 = 0.5;
                    break;
                  case 3: // water
                    eff2 = 2;
                    break;
                  default:
                    break;
                }
              }
              eff = 0.5/eff2;
              break;
            case 2:  // fire
              if (def.elemType2!.id != -1) {
                switch (def.elemType2!.id) {
                  case 1: // grass
                    eff2 = 2;
                    break;
                  case 3: // water
                    eff2 = 0.5;
                    break;
                  default:
                    break;
                }
              }
              eff = 2/eff2;
              break;
            case 3: // water
              if (def.elemType2!.id != -1) {
                switch (def.elemType2!.id) {
                  case 1: // grass
                    eff2 = 2;
                    break;
                  case 2: // fire
                    eff2 = 0.5;
                    break;
                  default:
                    break;
                }
              }                        
              eff = 0.5/eff2;
              break;
          }
          break;
          // case move type == normal, eff remains == 1       
      }
      return eff;
    }

  // -------------------------------------------------------------------------------

  // convertion funtions

  Move copyWith({
    String? name,
    ElemType? elemType,
    int? power,
    int? pp,
    int? curPp,
  }) {
    return Move(
      name: name ?? this.name,
      elemType: elemType ?? this.elemType,
      power: power ?? this.power,
      pp: pp ?? this.pp,
      curPp: curPp ?? this.curPp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'elemType': elemType.toMap(),
      'power': power,
      'pp': pp,
      'curPp': curPp,
    };
  }

  factory Move.fromMap(Map<String, dynamic> map) {
    return Move(
      name: map['name'] as String,
      elemType: ElemType.fromMap(map['elemType'] as Map<String,dynamic>),
      power: map['power'] as int,
      pp: map['pp'] as int,
      curPp: map['curPp'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Move.fromJson(String source) => Move.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Move(name: $name, elemType: $elemType, power: $power, pp: $pp, curPp: $curPp)';
  }

  @override
  bool operator ==(covariant Move other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.elemType == elemType &&
      other.power == power &&
      other.pp == pp &&
      other.curPp == curPp;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      elemType.hashCode ^
      power.hashCode ^
      pp.hashCode ^
      curPp.hashCode;
  }
}
