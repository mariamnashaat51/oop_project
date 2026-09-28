import 'package:project/oop_pro/client.dart';

class BankAccount {
  //todo: attributes
  static int idsGenerator = 1; // attribute for class, not object
  late int accountId;
  late double balance;
  late Client owner;

  //todo: constructors
  BankAccount({required this.balance}) {
    accountId = idsGenerator;
    idsGenerator++;
  }

  BankAccount.init() {
    balance = 0.0;
    accountId = idsGenerator;
    idsGenerator++;
  }

  BankAccount.mix({this.balance = 0.0}) {
    accountId = idsGenerator;
    idsGenerator++;
  }

  //todo: behavior ==> methods/function
  bool withdraw(double amount) {
    //todo: validation
    if (amount < 0) {
      print('Invalid amount.');
      return false;
    }
    if (amount > balance) {
      print('Invalid amount. Balance should be > amount');
      return false;
    }
    balance -= amount;
    return true;
  }

  bool deposit(double amount) {
    //todo: validation
    if (amount < 0) {
      print('Invalid amount.');
      return false;
    }
    balance += amount;
    return true;
  }

  void view() {
    print('Bank Account.');
    print('accountID: $accountId');
    print('balance: $balance');
    owner.view();
  }
}
