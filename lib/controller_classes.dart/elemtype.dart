import 'dart:convert';

class ElemType {
    // attributes
    String name;  // type name
    int id = -1;       // type number id:
                                // -1 = none
                                // 0 = normal
                                // 1 = grass
                                // 2 = fire
                                // 3 = water
                                // 4 = electric
                                // 5 = poison
                                // 6 = flying
                                // 7 = Dragon
    // constructor methods
  ElemType({
    required this.id,
    this.name = "-"    
  }) {
        switch (id) {
            case 0:
                name = "Normal";
                break;
            case 1:
                name = "Grass";
                break;
            case 2:
                name = "Fire";
                break;
            case 3:
                name = "Water";
                break;
            case 4:
                name = "Electric";
                break;
            case 5:
                name = "Poison";
                break;
            case 6:
                name = "Flying";
                break;
            case 7:
                name = "Dragon";
                break;
            default:
                name = "-";
                break;
        }
    }
    
    // -------------------------------------------------------------------------------

    // convertion funtions

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
    };
  }

  String toJson() => json.encode(toMap());

  factory ElemType.fromJson(dynamic json) {
    return ElemType(id: json['id'] as int);
  }

  factory ElemType.fromMap(Map<String, dynamic> map) {
    return ElemType(id: map['id'] as int);
  }

  factory ElemType.fromJsonString(String source) => ElemType.fromMap(json.decode(source) as Map<String, dynamic>);


  ElemType copyWith({
    String? name,
    int? id,
  }) {
    return ElemType(
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }

}
