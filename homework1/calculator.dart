import 'dart:io';

void main(List<String> args) {
  
  print("Select 2 numbers with a space between them and the action to be taken (e.g. 1 + 1):");
  String? input = stdin.readLineSync();
  
  if(input != null){
    
    List<String> inputs = input.split(" ");
    
    if (inputs.length == 3) {
      
      try {
        int num1 = int.parse(inputs[0]);
        String operator = inputs[1].toString();
        int num2 = int.parse(inputs[2]);
      
         switch (operator) {
          case '+':
            print('Total: ${num1 + num2}');
            break;
          case '-':
            print('Total: ${num1 - num2}');
            break;
          case '*':
            print('Total: ${num1 * num2}');
            break;
          case '/':
            if (num2 != 0) {
              print('Total: ${num1 / num2}');
            } else {
              throw ArgumentError("Divide by zero.");
            }
            break;
            default:
            throw ArgumentError("Invalid operator.");
        }
      } catch (e) {
        print("$e");  
      }

    } else {
       print("Invalid input.");
    }

  } else {
    print("Invalid input.");
  }

}