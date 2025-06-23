import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator/add.dart';

void main() {
  group('Add method test group', () {
    test('should return 0 if the string is empty', () {
      expect(add(''), equals(0));
    });

    test('should return the correct sum for a single number', () {
      expect(add('1'), equals(1));
      expect(add('1,'), equals(1));
      expect(add('100'), equals(100));
    });

    test('should return the correct sum for two numbers', () {
      expect(add('1,2'), equals(3));
      expect(add('1,4,'), equals(5));
      expect(add('100, 200'), equals(300));
    });

    test('should return the correct sum for any amount of numbers', () {
      expect(add('1,2,4,5,100,99'), equals(211));
      expect(add('1,2,4,5,100,99,'), equals(211));
    });

    test('should handle new lines between numbers instead of commas', () {
      expect(add('1\n2,3'), equals(6));
      expect(add('1\n2\n3'), equals(6));
    });

    test('should support different delimiters', () {
      expect(add('//;\n1;2'), equals(3));
      expect(add('//;;\n1;;2'), equals(3));
      expect(add('//;\n1;2;4;10\n12'), equals(29));
      expect(add('//;\n1\n2\n3'), equals(6));
    });
  });
}
