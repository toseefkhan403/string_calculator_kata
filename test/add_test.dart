import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator/add.dart';

void main() {
  test('add method should return 0 if the string is empty', () {
    final output = add('');
    expect(output, 0);
  });
}
