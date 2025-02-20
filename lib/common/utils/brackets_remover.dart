String removeSquareBrackets(String input) {
  // Expresión regular para eliminar corchetes
  return input.replaceAll(RegExp(r'\[|\]'), '');
}
