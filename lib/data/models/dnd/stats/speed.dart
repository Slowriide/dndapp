class Speed {
  final String? walk;
  final String? burrow;
  final String? fly;
  final String? swim;

  Speed({
    this.swim,
    this.walk,
    this.burrow,
    this.fly,
  });

  factory Speed.fromJson(Map<String, dynamic> json) => Speed(
        walk: json["walk"],
        burrow: json["burrow"],
        fly: json["fly"],
        swim: json["swim"],
      );

  Map<String, dynamic> toJson() => {
        "walk": walk,
        "burrow": burrow,
        "fly": fly,
        "swim": swim,
      };

  static defaultSpeed() {
    return 'walk';
  }
}
