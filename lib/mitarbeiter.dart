class Mitarbeiter {
  String name;
  int alter;
  Mitarbeiter({
    required this.name,
    required this.alter,
  });

  @override
  String toString() => '$name ($alter)';
}
