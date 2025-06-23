/// The method takes up comma/newline separated numbers and returns their sum
/// String must start with //[delimiter]\n for custom delimiters
int add(String numbers) {
  if (numbers.isEmpty) {
    return 0;
  }

  String delimiter = ',';
  if (numbers.startsWith('//')) {
    final parts = numbers.split('\n');
    delimiter = parts.first.substring(2);
    numbers = parts.sublist(1).join(delimiter);
  }

  final arr = numbers
      .replaceAll('\n', delimiter)
      .split(delimiter)
      .where((n) => n.isNotEmpty)
      .map(int.parse)
      .toList();
  final negatives = arr.where((item) => item < 0).toList();

  if (negatives.isNotEmpty) {
    throw Exception('negatives not allowed: ${negatives.join(',')}');
  }

  return arr.fold(0, (previousValue, element) => previousValue + element);
}
