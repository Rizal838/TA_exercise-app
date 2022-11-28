class Chest {
  final String? name;
  final String? type;
  final String? muscle;
  final String? equipment;
  final String? instructions;

  Chest({this.name, this.type, this.muscle, this.equipment,this.instructions});

  factory Chest.fromJson(dynamic json) {
    return Chest(
        name: json['name'] as String,
        type: json['type'] as String,
        equipment: json['equipment'] as String,
        instructions: json['instructions'] as String);
  }

  @override
  String toString(){
    return 'Chest {name: $name, type: $type, equipment: $equipment, instructions: $instructions}';
  }
}