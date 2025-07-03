# String Calculator (Flutter + TDD)

A simple Flutter application implementing a **String Calculator** using **Test-Driven Development (TDD)** principles.

This project demonstrates clean Dart logic, unit testing, and a minimal Flutter UI for interacting with the calculator.

---

## Features

- Add numbers from a comma-separated string
- Supports newlines (`\n`) between numbers
- Supports custom delimiters (e.g. `//;\n1;2`)
- Throws error on negative numbers with full list
- Fully covered with unit tests

## Project Structure

```
string_calculator/
├── lib/
│ ├── main.dart # Flutter UI
│ └── add.dart # add() function logic
├── test/
│ └── add_test.dart # TDD unit tests
├── pubspec.yaml
└── README.md
```

## Running the project

### Dependencies

Make sure you have Flutter installed. Then:
```bash
flutter pub get
```

Run tests:
```bash
flutter test
```

If you want to try out the UI:
```bash
flutter run
```
