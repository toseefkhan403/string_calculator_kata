/**
 * The method can take up to two numbers, separated by commas, and will return their sum. 
 */
int add(String numbers) {
  if (numbers.isEmpty) {
    return 0;
  }

  final arr = numbers.replaceAll('\n', ',').split(',');
  int res = 0;
  for (var item in arr) {
    if (item.isNotEmpty) {
      res += int.parse(item);
    }
  }

  return res;
}
