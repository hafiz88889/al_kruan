class AllahName {
  final String name;
  final String transliteration;
  final int number;
  final String meaning;

  AllahName({
    required this.name,
    required this.transliteration,
    required this.number,
    required this.meaning,
  });

  factory AllahName.fromJson(Map<String, dynamic> json) {
    return AllahName(
      name: json['name'],
      transliteration: json['transliteration'],
      number: json['number'],
      meaning: json['en']['meaning'],
    );
  }
}
