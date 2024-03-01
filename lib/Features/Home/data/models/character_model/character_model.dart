import 'package:rick_and_morty_application/Features/Home/Domain/Entities/character_entity.dart';

import 'location.dart';
import 'origin.dart';

class CharacterModel extends CharacterEntity {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  Origin? origin;
  Location? location;
  String? image;
  List<String>? episode;
  String? url;
  DateTime? created;

  CharacterModel({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
  }) : super(
          characterName: name,
          characterStatus: status,
          characterSpecies: species,
          characterGender: gender,
          characterImage: image,
          characterType: type,
        );

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      status: json['status'] as String?,
      species: json['species'] as String?,
      type: json['type'] as String?,
      gender: json['gender'] as String?,
      origin: json['origin'] == null
          ? null
          : Origin.fromJson(json['origin'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      image: json['image'] as String?,
      episode: (json['episode'] as List<dynamic>?)?.cast<String>(),
      url: json['url'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'status': status,
        'species': species,
        'type': type,
        'gender': gender,
        'origin': origin?.toJson(),
        'location': location?.toJson(),
        'image': image,
        'episode': episode,
        'url': url,
        'created': created?.toIso8601String(),
      };
}
