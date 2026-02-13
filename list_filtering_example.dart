

void main(){
  List number1 =  [2 , 11 , 12 , 33 , 14 , 55, 16, 77, 80, 90, 20];
  List number2 = [];
number2=number1.where((element)=>element.isEven).toList();

print("Even numbers: $number2");
} 