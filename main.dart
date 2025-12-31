import 'dart:io';

void main(){
  double price =-1;
print("--- Welcome to Discount Calculator ---");
while (price !=0){
  print("\nENTER THE PRICE (or 0 to exit):");
  String? input=stdin.readLineSync();
  price = double.parse(input!);

  if(price==0){
    print("Closing program... Goodbye!");
  }else if (price >=100){
    double off = price * 0.20;
    double finalPrice = price -off;
    print("You got 20% discount! Final price: $finalPrice");
  }else{
    print("No discount for this price. Final price: $price");
  }
}
}