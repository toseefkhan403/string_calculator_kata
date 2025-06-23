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

  final arr = numbers.replaceAll('\n', delimiter).split(delimiter);
  int res = 0;
  for (var item in arr) {
    if (item.isNotEmpty) {
      res += int.parse(item);
    }
  }

  return res;
}
