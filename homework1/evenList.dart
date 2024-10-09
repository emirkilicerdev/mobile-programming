import 'dart:io';

void numbercalc(inputList){

  List<int> numList = [];
  
  if (inputList == null || inputList == "") {
    throw ArgumentError("Can not be empty");
  }

  try {
    numList = inputList.split(" ").map((e) => int.parse(e)).toList().cast<int>();
  } catch (e) {
    throw ArgumentError("Invalid input.");
  }

  if (numList.length != 10) {
    throw ArgumentError("Invalid input.");
  }

  int numCounter = 0;
  
  for (int element in numList) {
    if (element.isEven) {
      print(element);
      numCounter++;
    }
  }

  if (numCounter == 0) {
    print("No even numbers");
  }
}

void main(List<String> args){
  String? input = stdin.readLineSync();
  
  try {
    numbercalc(input);
  } catch (e) {
    print("$e");
  }

}




