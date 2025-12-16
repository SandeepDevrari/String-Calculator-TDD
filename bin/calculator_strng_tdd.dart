import 'package:test/test.dart';

void main(List<String> arguments) {
  test("input '' output 0", ()=> expect(add(''), 0));
  test("input '1' output 1", ()=> expect(add('1'), 1));
  test("input '2' output 2", ()=> expect(add('2'), 2));
  test("input '3' output 3", ()=> expect(add('3'), 3));
  test("input '10' output 10", ()=> expect(add('10'), 10));
  test("input '100' output 100", ()=> expect(add('100'), 100));
  test("input '100000' output 100000", ()=> expect(add('100000'), 100000));
  test("input '2,3' output 5", ()=> expect(add('2,3'), 5));
}

int add(String numbers){
  final numberList = numbers.split(",");
  int sum = 0;
  for(String i in numberList){
    sum += int.tryParse(i)??0;
  }
  return sum;
  // return int.tryParse(numbers)??0;
}