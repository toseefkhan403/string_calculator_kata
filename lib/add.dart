/// The method takes up comma/newline separated numbers and returns their sum
/// String must start with //[delimiter]\n for custom delimiters
/// if the delimiter is * multiply the numbers
int customArithmetic(String numbers) {
  if (numbers.isEmpty) {
    return 0;
  }

  Delimiter delimiter = Delimiter.fromType(',');
  if (numbers.startsWith('//')) {
    final parts = numbers.split('\n');
    delimiter = Delimiter.fromType(parts.first.substring(2));
    numbers = parts.sublist(1).join(delimiter.character);
  }

  final arr = numbers
      .replaceAll('\n', delimiter.character)
      .split(delimiter.character)
      .where((n) => n.isNotEmpty)
      .map(int.parse)
      .toList();
  final negatives = arr.where((item) => item < 0).toList();

  if (negatives.isNotEmpty) {
    throw Exception('negatives not allowed: ${negatives.join(',')}');
  }

  return delimiter.process(arr);
}

abstract class Delimiter {
  final String character;

  Delimiter(this.character);

  factory Delimiter.fromType(String char) {
    switch (char) {
      case '*':
        return StarDelimiter(char);
      default:
        return CustomDelimiter(char);
    }
  }

  int process(List<int> arr);
}

class StarDelimiter extends Delimiter {
  StarDelimiter(String char) : super(char);
  // final String char;

  // @override
  // String get character => char;

  @override
  int process(List<int> arr) {
    return arr.fold(1, (previousValue, element) => previousValue * element);
  }
}

class CustomDelimiter extends Delimiter {
  CustomDelimiter(String char) : super(char);
  // final String char;

  // @override
  // String get character => char;

  @override
  int process(List<int> arr) {
    return arr.fold(0, (previousValue, element) => previousValue + element);
  }
}
