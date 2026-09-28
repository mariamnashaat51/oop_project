import 'package:project/oop_pro/bank_account.dart';

class SavingBankAccount extends BankAccount {
  //todo: attributes
  double minimumBalance;

  //todo: constructors
  SavingBankAccount({required super.balance, this.minimumBalance = 1000});

  //todo: behavior ==> methods/function
  @override
  bool withdraw(double amount) {
    //todo: validation
    if (balance - amount < minimumBalance) {
      print('Invalid amount. Initial Balance should be > min balance');
      return false;
    }
    return super.withdraw(amount);
  }

  @override
  bool deposit(double amount) {
    //todo: validation
    if(amount < 100){
      print('Invalid amount. amount should be >= 100');
      return false;
    }
    return super.deposit(amount);
  }

  @override
  void view() {
    print('Saving Bank Account.');
    print('accountID: $accountId');
    print('balance: $balance');
    print('minimumBalance: $minimumBalance');

  }
}
