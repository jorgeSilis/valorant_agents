class Agent {
  String uuid;
  String displayName;
  String description;
  String developerName;
  String fullPortrait;
  String bustPortrait;
  Role role;
  List<Ability> abilities;

  Agent({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.developerName,
    required this.fullPortrait,
    required this.bustPortrait,
    required this.role,
    required this.abilities,
  });

  factory Agent.fromJson(Map<String, dynamic> json) {
    return Agent(
      uuid: json['uuid'],
      displayName: json['displayName'],
      description: json['description'],
      developerName: json['developerName'],
      fullPortrait: json['fullPortrait'],
      bustPortrait: json['displayIcon'],
      role: Role.fromJson(json['role']),
      abilities: List<Ability>.from(json['abilities'].map((abilityJson) => Ability.fromJson(abilityJson))),
    );
  }
}

class Role {
  final String uuid;
  final String displayName;
  final String description;

  Role({
    required this.uuid,
    required this.displayName,
    required this.description,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      uuid: json['uuid'],
      displayName: json['displayName'],
      description: json['description'],
    );
  }
}

class Ability {
  final String slot;
  final String displayName;
  final String description;
  final String? displayIcon;

  Ability({
    required this.slot,
    required this.displayName,
    required this.description,
    this.displayIcon,
  });

  factory Ability.fromJson(Map<String, dynamic> json) {
    return Ability(
      slot: json['slot'],
      displayName: json['displayName'],
      description: json['description'],
      displayIcon: json['displayIcon'],
    );
  }
}
