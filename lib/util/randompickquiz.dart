List<dynamic> getRandomQuizzes(List<dynamic>? materials, {required String code, required int index}) {
  if (materials == null) {
    return [];
  }

  materials.shuffle();
  return materials.toSet().toList(growable: false).sublist(0, 5);
}