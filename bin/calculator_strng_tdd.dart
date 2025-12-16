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
  test("input '2,3,4,5' output 14", ()=> expect(add('2,3,4,5'), 14));
  test("input '12,13,14,15' output 54", ()=> expect(add('12,13,14,15'), 54));
  test("input '1\n2,3' output 6", ()=> expect(add('1\n2,3'), 6));
  test("input '1\n2,3\n4\n5\n6,7\n10' output 38", ()=> expect(add('1\n2,3\n4\n5\n6,7\n10'), 38));
  test("input '1\n\n2,3\n\n\n\n\n4\n5\n6,,,,,,7\n\n\n\n10,,,,' output 38", ()=> expect(add('1\n\n2,3\n\n\n\n\n4\n5\n6,,,,,,7\n\n\n\n10,,,,'), 38));
  test("input '//;\n1;2' output 3", ()=> expect(add('//;\n1;2'), 3));
  test("input '//;\n1;2;3;4;5\n6\n7\n8' output 36", ()=> expect(add('//;\n1;2;3;4;5\n6\n7\n8'), 36));
  test("input '//-\n1-2-3-4-5\n6\n7\n8' output 36", ()=> expect(add('//-\n1-2-3-4-5\n6\n7\n8'), 36));
  test("delimiter can be of any length", ()=> expect(add('//[***]\n1***2***3'), 6));
  test("delimiter can be of any length input '//[--]\n1--2--3--4--5\n6\n7\n8' output 36", ()=> expect(add('//[--]\n1--2--3--4--5\n6\n7\n8'), 36));
  // test("input '//****\n1****2****3\n6\n7\n8' output 27", ()=> expect(add('//****\n1****2****3\n6\n7\n8'), 27));
  // test("input '//*\n' output 0", ()=> expect(add('//*\n'), 0));
  // test("input '//*\n-11' output exception negative not allowed", ()=> expect(()=>add('//*\n-11'), throwsA(predicate((e) => e.toString().contains("negative not allowed -11")))));
  // test("input '//*\n-1*-2*-3' output exception negative not allowed", ()=> expect(()=>add('//*\n-1*-2*-3'), throwsA(predicate((e) => e.toString().contains("negative not allowed -1,-2,-3")))));
  // test("input '//,\n1,2,3,4,5,6,-1,-2,-3,-5,-6,7,8,-7,9,-8,-9,10,-10' output exception negative not allowed", ()=> expect(()=>add('//,\n1,2,3,4,5,6,-1,-2,-3,-5,-6,7,8,-7,9,-8,-9,10,-10'), throwsA(predicate((e) => e.toString().contains("negative not allowed -1,-2,-3,-5,-6,-7,-8,-9,-10")))));
}

int add(String numbers){
  if(numbers.isEmpty) return 0;
  String delimiter = ',';
  if(numbers.startsWith("//")){
    int delimiterEndIndex = numbers.indexOf("\n");
    final delimiters = numbers.substring(2,delimiterEndIndex);
    if(delimiters.startsWith("[")) {
      int delimiterBoxEndIndex = delimiters.indexOf("]");
      delimiter = delimiters.substring(1, delimiterBoxEndIndex);
    }else{
      delimiter = delimiters;
    }
    numbers = numbers.substring(delimiterEndIndex+1);
  }
  numbers = numbers.replaceAll("\n", delimiter);
  final numberList = numbers.split(delimiter);
  int sum = 0;
  bool hasNegative = false;
  String negativeNumbers = "";
  for(String i in numberList){
    int number = int.tryParse(i)??0;
    if(number < 0){
      hasNegative = true;
      negativeNumbers += i + ",";
      continue;
    }
    sum += int.tryParse(i)??0;
  }
  if(hasNegative){
    throw Exception("negative not allowed $negativeNumbers");
  }
  return sum;
  // return int.tryParse(numbers)??0;
}