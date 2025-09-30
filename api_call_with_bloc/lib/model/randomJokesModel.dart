class RandomJokes {
  RandomJokes({
    required this.type,
    required this.setup,
    required this.punchline,
    required this.id,
    required this.error,
  });

  final String? type;
  final String? setup;
  final String? punchline;
  final int? id;
  final String? error;

  factory RandomJokes.fromJson(Map<String, dynamic> json) {
    return RandomJokes(
      type: json["type"],
      setup: json["setup"],
      punchline: json["punchline"],
      id: json["id"],
      error: json["error"],
    );
  }
}
