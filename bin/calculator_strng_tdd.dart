import 'package:test/test.dart';

void main(List<String> arguments) {
  test("input '' output 0", ()=> expect(add(''), 0));
  test("input '1' output 1", ()=> expect(add('1'), 1));
  test("input '2' output 2", ()=> expect(add('2'), 2));
  test("input '3' output 3", ()=> expect(add('3'), 3));
  test("input '10' output 10", ()=> expect(add('10'), 10));
}

int add(String numbers){
  return int.tryParse(numbers)??0;
}