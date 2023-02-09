
import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:fluttermon/src/shared/models/elemtype.dart';
import 'package:fluttermon/src/shared/models/move.dart';
import 'package:fluttermon/src/shared/utils/consts.dart';

class Pokemon {
    // attributes
    String? owner;            // owner user name
    String? frontImgSrc;     // front image
    String? backImgSrc;      // back image
    int spsnum;              // species number
    String? species;         // pokémon species    
    String? name;            // pokémon name
    ElemType? elemType1;     // pokémon type 1
    ElemType? elemType2;     // pokémon type 2
                                   // 0 = normal
                                   // 1 = grass
                                   // 2 = fire
                                   // 3 = water
                                   // 4 = electric
                                   // 5 = poison
                                   // 6 = flying
                                   // 7 = Dragon
    int? level;     // experience
    int? hp;        // maximum health points
    int? curhp;     // current health points
    bool? fainted;  // if fainted, it's unable to battle
    int? atk;       // attack
    int? def;       // defense
    int? spe;       // speed
    bool? npc;      // true if the pokémon is an NPC
    List<Move?>? moves;   // pokémon moves
    List<int>? ev;        // levels required for evolution/
    List<String>? evnames;
    List<ElemType>? ev1elemtypes;
    List<int>? ev1stats;
    List<ElemType>? ev2elemtypes;
    List<int>? ev2stats;
    List<int>? lvlup;          // levels for learning new moves
    List<Move?>? lvlupmoves;   // new moves for learn when level up
    
  // species constructor methods
  Pokemon({
    this.owner,
    this.frontImgSrc,
    this.backImgSrc,
    required this.spsnum,
    this.species,
    this.name,
    this.elemType1,
    this.elemType2,
    this.level,
    this.hp,
    this.curhp,
    this.fainted,
    this.atk,
    this.def,
    this.spe,
    this.npc,
    this.moves,
    this.ev,
    this.evnames,
    this.ev1elemtypes,
    this.ev1stats,
    this.ev2elemtypes,
    this.ev2stats,
    this.lvlup,
    this.lvlupmoves,
  }) {      
        if (spsnum == 1) {
          // bulbasaur constructor
            level = 1;
            frontImgSrc = Consts.bulbasaurFrontImg;
            backImgSrc = Consts.bulbasaurBackImg;
            setSpecies(Consts.bulbasaurSpecies);
            // type 1
            setType1(ElemType(id:1));
            // type 2
            setType2(ElemType(id:5));
            // status
            setHp(45);
            setCurhp(45);
            setAtk(65);
            setDef(65);
            setSpe(45);
            // moves
            moves = List.generate(4, (index) => null);     
            setMove(0, Move(name:"Tackle", elemType:ElemType(id:0), power:40, pp:35));
            setMove(1, Move(name:"VineWhip", elemType:ElemType(id:1), power:45, pp:25));
            setMove(2, Move(elemType:ElemType(id:-1)));
            setMove(3, Move(elemType:ElemType(id:-1)));
            // evolution levels
            ev = [16, 32];
            // evolutions stats
            evnames = [Consts.ivysaurSpecies, Consts.venusaurSpecies];
            ev1elemtypes = [ElemType(id:1), ElemType(id:5)];
            ev1stats = [60, 62, 63, 60];
            ev2elemtypes = [ElemType(id:1), ElemType(id:5)];
            ev2stats = [80, 100, 100, 80];
            // levels to learn new moves
            lvlup = [12, 18, 21, 33, 36];
            // Moves to be learned when level up
            lvlupmoves = [Move(name:"Razor Leaf", elemType:ElemType(id:1), power:55, pp:25),
                          Move(name:"Seed Bomb", elemType:ElemType(id:1), power:80, pp:15),
                          Move(name:"Take Down", elemType:ElemType(id:0), power:90, pp:10),
                          Move(name:"Double Edge", elemType:ElemType(id:0), power:120, pp:15),
                          Move(name:"Solar Beam", elemType:ElemType(id:1), power:120, pp:10)];
        } else if (spsnum == 2) {
          // charmander constructor
            frontImgSrc = Consts.charmanderFrontImg;
            backImgSrc = Consts.charmanderBackImg;
            level = 1;
            setSpecies(Consts.charmanderSpecies);
            // type 1
            setType1(ElemType(id:2));
            // type 2
            setType2(ElemType(id:-1));
            // status
            setHp(39);
            setCurhp(39);
            setAtk(60);
            setDef(50);
            setSpe(65);
            // moves
            moves = List.generate(4, (index) => null);
            setMove(0, Move(name:"Scratch", elemType:ElemType(id:0), power:40, pp:35));
            setMove(1, Move(name:"Ember", elemType:ElemType(id:2), power:40, pp:25));
            setMove(2, Move(elemType:ElemType(id:-1)));
            setMove(3, Move(elemType:ElemType(id:-1)));
            // evolution levels
            ev = [16, 36];
            // evolutions stats
            evnames = [Consts.charmeleonSpecies, Consts.charizardSpecies];
            ev1elemtypes = [ElemType(id:2), ElemType(id:-1)];
            ev1stats = [58, 64, 65, 80];
            ev2elemtypes = [ElemType(id:2), ElemType(id:6)];
            ev2stats = [78, 109, 85, 100];
            // levels to learn new moves
            lvlup = [12, 17, 20, 24, 40];
            // Moves to be learned when level up
            lvlupmoves = [Move(name:"Dragon Breath", elemType:ElemType(id:7), power:60, pp:20),
                          Move(name:"Fire Fang", elemType:ElemType(id:2), power:65, pp:15),
                          Move(name:"Slash", elemType:ElemType(id:0), power:70, pp:20),
                          Move(name:"Flamethrower", elemType:ElemType(id:2), power:90, pp:15),
                          Move(name:"Flare Blitz", elemType:ElemType(id:2), power:120, pp:15)];
        } else if (spsnum == 3) {
            // squirtle constructor
            frontImgSrc = Consts.squirtleFrontImg;
            backImgSrc = Consts.squirtleBackImg;
            level = 1;
            setSpecies(Consts.squirtleSpecies);
            // type 1
            setType1(ElemType(id:3));
            // type 2
            setType2(ElemType(id:-1));
            // status
            setHp(44);
            setCurhp(44);
            setAtk(50);
            setDef(65);
            setSpe(43);
            // moves
            moves = List.generate(4, (index) => null);
            setMove(0, Move(name:"Tackle", elemType:ElemType(id:0), power:40, pp:35));
            setMove(1, Move(name:"Water Gun", elemType:ElemType(id:3), power:40, pp:25));
            setMove(2, Move(elemType:ElemType(id:-1)));
            setMove(3, Move(elemType:ElemType(id:-1)));
            // evolution levels
            ev = [16, 36];
            // evolutions stats
            evnames = [Consts.wartortleSpecies, Consts.blastoiseSpecies];
            ev1elemtypes = [ElemType(id:3), ElemType(id:-1)];
            ev1stats = [59, 65, 80, 58];
            ev2elemtypes = [ElemType(id:3), ElemType(id:-1)];
            ev2stats = [79, 135, 120, 78];
            // levels to learn new moves
            lvlup = [9, 15, 24, 33, 36];
            // Moves to be learned when level up
            lvlupmoves = [Move(name:"Water Pulse", elemType:ElemType(id:3), power:60, pp:20),
                        Move(name:"Aqua Tail", elemType:ElemType(id:3), power:90, pp:10),
                        Move(name:"Hydro Pump", elemType:ElemType(id:3), power:110, pp:5),
                        Move(name:"Skull Bash", elemType:ElemType(id:0), power:130, pp:10)];
        }
    }
    // getter and setter methods - not all attributes have public setter methods
    String getSpecies() {
        return species!;
    }
    void setSpecies(String sp) {
        species = sp;
    }
    String getName() {
        return name!;
    }
    void setName(String name) {
        name = name;
    }
    ElemType getType1() {
        return elemType1!;
    }
    void setType1(ElemType t) {
        elemType1 = t;
    }
    ElemType getType2() {
        return elemType2!;
    }
    void setType2(ElemType t) {
        elemType2 = t;
    }
    int? getLevel() {
        return level;
    }
    void levelUp(int lvl) { // equivalent to "setLevel()" ------------
        level = getLevel()! + lvl;
        if (level! >= 100) {
            level = 100;
        }
        evolve();
        //learnMove();
    }
    int? getHp() {
        return hp;
    }
    void setHp(int hp) {
        hp = hp;
    }
    int? getCurhp() {
        return curhp;
    }
    void setCurhp(int curhp) {
        curhp = curhp;
        if (curhp <= 0) {
            curhp = 0;
        }
    }
    void setFainted() {
        if (curhp! <= 0) {
            fainted = true;
        }
    }
    int getAtk() {
        return atk!;
    }
    void setAtk(int atk) {
        atk = atk;
    }
    int getDef() {
        return def!;
    }
    void setDef(int def) {
        def = def;
    }
    int getSpe() {
        return spe!;
    }
    bool isNpc() {
        return npc!;
    }  
    void setNpc(bool npc) {
        npc = npc;
    }    
    void setSpe(int spe) {
        spe = spe;
    }
    Move getMove(int n) {
        return moves![n]!;
    }
    void setMove(int n, Move m) {
        moves![n] = m;
    }
       
    // method for choosing a move (random if is a NPC) -------------------------
    Move? chooseMove(int n) {
        Move? a;
        if (isNpc()) {
            bool invalidMove = true;
            while (invalidMove) {
                Random op = Random(3);
                int m  = op.nextInt(3);
                switch (m) {
                    case 0:
                        if (getMove(0).name != "-") {
                            a = getMove(0);
                            invalidMove = false;
                        }
                        break;
                    case 1:
                        if (getMove(1).name != "-") {
                            a = getMove(1);
                            invalidMove = false;
                        }
                        break;
                    case 2:
                        if (getMove(2).name != "-") {
                            a = getMove(2);
                            invalidMove = false;
                        }
                        break;
                    case 3:
                        if (getMove(3).name != "-") {
                            a = getMove(3);
                            invalidMove = false;
                        }
                        break;
                }
            }
        } else {
            if (moves![n]!.name != "-") {
                a = moves![n];
            } else {
                a = null;
            }
        }
        return a;
    }
    // method for STAB (Same Type Attack Bonus)---------------------------------
    double stab(Move m) {
        double stab;
        if (elemType1 == m.elemType || elemType2 == m.elemType) {
            stab = 1.5;
        } else {
            stab = 1;
        }
        return stab;
    }
    
    // method for learning a new move if the required level is achieved --------
    /*
    void learnMove() {
        for (int i=0; i < moves.length; i++) {
            if (getLevel() == lvlup[i]) {
                bool invAns = true;
                do {
                    Scanner lvlt = new Scanner(System.in);
                    System.out.println(getName()+" wants to learn the move "+lvlupmoves[i].name+".");
                    System.out.println("Do you want to learn move?");
                    System.out.println("[1] - Yes");
                    System.out.println("[2] - No");
                    int ans = lvlt.nextInt();
                    if (ans == 1) {
                        boolean invOp = true;
                        do {
                        System.out.println("Which move should be replaced by "+lvlupmoves[i].name+"?");
                        System.out.println("Choose the move space number in the following order or 5 to exit: ");
                        showMoves();
                        int op = lvlt.nextInt();
                        if (0 < op && op < 5) {
                            moves[op-1] = lvlupmoves[i];
                            System.out.println(getName()+" learned "+moves[op-1].name+"!");
                            invOp = false;
                            invAns = false;
                        } else if (op == 5) {
                            invOp = false;
                        } else {
                            System.out.println("Invalid option selected!");
                        }
                        } while (invOp);
                    } else if (ans == 2) {
                        System.out.println(getName()+" did not learn the move "+lvlupmoves[i].name);
                        invAns = false;
                    } else {
                        System.out.println("Invalid option selected!");
                    }
                } while (invAns);
            }
        }
    }
    */
    
    // method for evolving the pokémon if the required level is achieved -------
    void evolve() {
        if (getLevel() == ev![0]) {
            //System.out.println(getName()+" has evolved to "+evnames[0]+"!");
            setName(evnames![0]);
            setType1(ev1elemtypes![0]);
            setType2(ev1elemtypes![1]);
            setHp(ev1stats![0]);
            setAtk(ev1stats![1]);
            setDef(ev1stats![2]);
            setSpe(ev1stats![3]);
        } else if (getLevel() == ev![1]) {
            //System.out.println(getName()+" has evolved to "+evnames[0]+"!");
            setName(evnames![1]);
            setType1(ev2elemtypes![0]);
            setType2(ev2elemtypes![1]);
            setHp(ev2stats![0]);
            setAtk(ev2stats![1]);
            setDef(ev2stats![2]);
            setSpe(ev2stats![3]);
        }
    }

    // -------------------------------------------------------------------------------

    // convertion funtions


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'owner' : owner,
      'frontImgSrc': frontImgSrc,
      'backImgSrc': backImgSrc,
      'spsnum': spsnum,
      'species': species,
      'name': name,
      'elemType1': elemType1?.toMap(),
      'elemType2': elemType2?.toMap(),
      'level': level,
      'hp': hp,
      'curhp': curhp,
      'fainted': fainted,
      'atk': atk,
      'def': def,
      'spe': spe,
      'npc': npc,
      'moves': moves!.map((x) => x?.toMap()).toList(),
      'ev': ev,
      'evnames': evnames,
      'ev1elemtypes': ev1elemtypes!.map((x) => x.toMap()).toList(),
      'ev1stats': ev1stats,
      'ev2elemtypes': ev2elemtypes!.map((x) => x.toMap()).toList(),
      'ev2stats': ev2stats,
      'lvlup': lvlup,
      'lvlupmoves': lvlupmoves!.map((x) => x?.toMap()).toList(),
    };
  }

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
      owner: map['owner'] as String,
      frontImgSrc: map['frontImgSrc'] != null ? map['frontImgSrc'] as String : null,
      backImgSrc: map['backImgSrc'] != null ? map['backImgSrc'] as String : null,
      spsnum: map['spsnum'] as int,
      species: map['species'] != null ? map['species'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      elemType1: map['elemType1'] != null ? ElemType.fromMap(map['elemType1'] as Map<String,dynamic>) : null,
      elemType2: map['elemType2'] != null ? ElemType.fromMap(map['elemType2'] as Map<String,dynamic>) : null,
      level: map['level'] != null ? map['level'] as int : null,
      hp: map['hp'] != null ? map['hp'] as int : null,
      curhp: map['curhp'] != null ? map['curhp'] as int : null,
      fainted: map['fainted'] != null ? map['fainted'] as bool : null,
      atk: map['atk'] != null ? map['atk'] as int : null,
      def:map['def'] != null ? map['def'] as int : null,
      spe: map['spe'] != null ? map['spe'] as int : null,
      npc: map['npc'] != null ? map['npc'] as bool : null,
      moves: map['moves'] != null ? List<Move?>.from((map['moves'] as List<dynamic>).map<Move?>((x) => Move.fromMap(x as Map<String,dynamic>),),) : null,
      ev: map['ev'] != null ? List<int>.from(map['ev'] as List<dynamic>) : null,
      evnames: map['evnames'] != null ? List<String>.from(map['evnames'] as List<dynamic>) : null,
      ev1elemtypes: map['ev1elemtypes'] != null ? List<ElemType>.from((map['ev1elemtypes'] as List<dynamic>).map<ElemType?>((x) => ElemType.fromMap(x as Map<String,dynamic>),),) : null,
      ev1stats: map['ev1stats'] != null ? List<int>.from(map['ev1stats'] as List<dynamic>) : null,
      ev2elemtypes: map['ev2elemtypes'] != null ? List<ElemType>.from((map['ev2elemtypes'] as List<dynamic>).map<ElemType?>((x) => ElemType.fromMap(x as Map<String,dynamic>),),) : null,
      ev2stats: map['ev2stats'] != null ? List<int>.from(map['ev2stats'] as List<dynamic>) : null,
      lvlup: map['lvlup'] != null ? List<int>.from(map['lvlup'] as List<dynamic>) : null,
      lvlupmoves: map['lvlupmoves'] != null ? List<Move?>.from((map['lvlupmoves'] as List<dynamic>).map<Move?>((x) => Move?.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pokemon.fromJson(String source) => Pokemon.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Pokemon(owner: $owner, frontImgSrc: $frontImgSrc, backImgSrc: $backImgSrc, spsnum: $spsnum, species: $species, name: $name, elemType1: $elemType1, elemType2: $elemType2, level: $level, hp: $hp, curhp: $curhp, fainted: $fainted, atk: $atk, def: $def, spe: $spe, npc: $npc, moves: $moves, ev: $ev, evnames: $evnames, ev1elemtypes: $ev1elemtypes, ev1stats: $ev1stats, ev2elemtypes: $ev2elemtypes, ev2stats: $ev2stats, lvlup: $lvlup, lvlupmoves: $lvlupmoves)';
  }

  @override
  bool operator ==(covariant Pokemon other) {
    if (identical(this, other)) return true;
  
    return 
      other.owner == owner &&
      other.frontImgSrc == frontImgSrc &&
      other.backImgSrc == backImgSrc &&
      other.spsnum == spsnum &&
      other.species == species &&
      other.name == name &&
      other.elemType1 == elemType1 &&
      other.elemType2 == elemType2 &&
      other.level == level &&
      other.hp == hp &&
      other.curhp == curhp &&
      other.fainted == fainted &&
      other.atk == atk &&
      other.def == def &&
      other.spe == spe &&
      other.npc == npc &&
      listEquals(other.moves, moves) &&
      listEquals(other.ev, ev) &&
      listEquals(other.evnames, evnames) &&
      listEquals(other.ev1elemtypes, ev1elemtypes) &&
      listEquals(other.ev1stats, ev1stats) &&
      listEquals(other.ev2elemtypes, ev2elemtypes) &&
      listEquals(other.ev2stats, ev2stats) &&
      listEquals(other.lvlup, lvlup) &&
      listEquals(other.lvlupmoves, lvlupmoves);
  }

  @override
  int get hashCode {
    return owner.hashCode ^
      frontImgSrc.hashCode ^
      backImgSrc.hashCode ^
      spsnum.hashCode ^
      species.hashCode ^
      name.hashCode ^
      elemType1.hashCode ^
      elemType2.hashCode ^
      level.hashCode ^
      hp.hashCode ^
      curhp.hashCode ^
      fainted.hashCode ^
      atk.hashCode ^
      def.hashCode ^
      spe.hashCode ^
      npc.hashCode ^
      moves.hashCode ^
      ev.hashCode ^
      evnames.hashCode ^
      ev1elemtypes.hashCode ^
      ev1stats.hashCode ^
      ev2elemtypes.hashCode ^
      ev2stats.hashCode ^
      lvlup.hashCode ^
      lvlupmoves.hashCode;
  }
}
