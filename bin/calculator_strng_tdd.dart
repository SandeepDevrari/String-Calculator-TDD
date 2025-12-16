import 'package:test/test.dart';

void main(List<String> arguments) {
  test("input '' output 0", ()=> expect(add(''), 0));
  test("input '1' output 1", ()=> expect(add('1'), 1));
}

int add(String numbers){
  return int.tryParse(numbers)??0;
}