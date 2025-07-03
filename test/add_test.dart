import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator/add.dart';

void main() {
  group('Add method test group', () {
    test('should return 0 if the string is empty', () {
      expect(customArithmetic(''), equals(0));
    });

    test('should return the correct sum for a single number', () {
      expect(customArithmetic('1'), equals(1));
      expect(customArithmetic('1,'), equals(1));
      expect(customArithmetic('100'), equals(100));
    });

    test('should return the correct sum for two numbers', () {
      expect(customArithmetic('1,2'), equals(3));
      expect(customArithmetic('1,4,'), equals(5));
      expect(customArithmetic('100, 200'), equals(300));
    });

    test('should return the correct sum for any amount of numbers', () {
      expect(customArithmetic('1,2,4,5,100,99'), equals(211));
      expect(customArithmetic('1,2,4,5,100,99,'), equals(211));
    });

    test('should handle new lines between numbers instead of commas', () {
      expect(customArithmetic('1\n2,3'), equals(6));
      expect(customArithmetic('1\n2\n3'), equals(6));
    });

    test('should support different delimiters', () {
      expect(customArithmetic('//;\n1;2'), equals(3));
      expect(customArithmetic('//;;\n1;;2'), equals(3));
      expect(customArithmetic('//;\n1;2;4;10\n12'), equals(29));
      expect(customArithmetic('//;\n1\n2\n3'), equals(6));
    });

    test('should throw exception for negative number', () {
      expect(
        () => customArithmetic('1,-2'),
        throwsA(
          predicate(
            (e) =>
                e is Exception &&
                e.toString().contains('negatives not allowed: -2'),
          ),
        ),
      );
      expect(
        () => customArithmetic('//;\n1;-2'),
        throwsA(
          predicate(
            (e) =>
                e is Exception &&
                e.toString().contains('negatives not allowed: -2'),
          ),
        ),
      );
    });

    test('should show all negatives in exception', () {
      expect(
        () => customArithmetic('1,-2,-3,-4'),
        throwsA(
          predicate(
            (e) =>
                e is Exception &&
                e.toString().contains('negatives not allowed: -2,-3,-4'),
          ),
        ),
      );
      expect(
        () => customArithmetic('//;\n1;-2;-4'),
        throwsA(
          predicate(
            (e) =>
                e is Exception &&
                e.toString().contains('negatives not allowed: -2,-4'),
          ),
        ),
      );
    });

    test('if the custom delimiter is * multiply the numbers', () {
      expect(customArithmetic("//\*\n1*2*4"), equals(8));
      expect(customArithmetic("//\*\n1*2*4*2"), equals(16));
    });
  });
}
