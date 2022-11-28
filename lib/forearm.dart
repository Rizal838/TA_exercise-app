class Forearm {
  final String? name;
  final String? type;
  final String? muscle;
  final String? equipment;
  final String? instructions;

  Forearm({this.name, this.type, this.muscle, this.equipment,this.instructions});

  factory Forearm.fromJson(dynamic json) {
    return Forearm(
        name: json['name'] as String,
        type: json['type'] as String,
        equipment: json['equipment'] as String,
        instructions: json['instructions'] as String);
  }

  @override
  String toString(){
    return 'Forearm {name: $name, type: $type, equipment: $equipment, instructions: $instructions}';
  }
}