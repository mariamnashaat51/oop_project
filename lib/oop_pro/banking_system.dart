import 'dart:io';

import 'package:project/oop_pro/client.dart';
import 'package:project/oop_pro/bank_account.dart';
import 'package:project/oop_pro/saving_bank_account.dart';

class BankingSystem {
  late List<BankAccount> accountsList;
  late List<Client> clientsList;

  BankingSystem() {
    accountsList = [];
    clientsList = [];

    addTestData();
  }

  /// fake data or moc data or test data
  void addTestData() {
    for (int i = 1; i <= 20; i++) {
      BankAccount bankAccount = BankAccount(balance: i * 1000);
      Client client = Client(
        name: 'Client Name $i',
        phone: 'Client Phone $i',
        address: 'Client Address $i',
      );

      bankAccount.owner = client;
      client.account = bankAccount;

      accountsList.add(bankAccount);
      clientsList.add(client);
    }
  }

  void showMenu() {
    while (true) {
      print('1. Create Account.');
      print('2. Show All Accounts. ');
      print('3. Show Account Details. ');
      print('4. Delete Account.');
      print('5. Withdraw.');
      print('6. Deposit.');
      print('7. Exit.');

      stdout.write('please enter choice: ');
      int choice = int.parse(stdin.readLineSync()!);

      if (choice == 1) {
        createAccount();
      } else if (choice == 2) {
        showAllMenu();
      } else if (choice == 3) {
        indexShowAccountDetails();
        // valueShowAccountDetails();
      } else if (choice == 4) {
        // deleteAccountIndex();
        deleteAccountValue();
      } else if (choice == 5) {
        withdrawIndex();
        // withdrawValue();
      } else if (choice == 6) {
        // depositIndex();
        depositValue();
      } else if (choice == 7) {
        // break; //break from loop, else if
        return; // from function
      }
    }
  }

  void showAllMenu() {
    for (var acc in accountsList) {
      acc.view();
      print('-------------------------------------');
    }
    // for (int i = 0; i < accountsList.length; i++) {
    //   accountsList[i].view();
    //   print('-------------------------------------');
    // }
  }

  /// search ==> return index
  int searchIndex(int accountId) {
    for (int i = 0; i < accountsList.length; i++) {
      if (accountId == accountsList[i].accountId) {
        return i;
      }
    }
    return -1;
  }

  /// search ==> return value
  BankAccount? searchByAccountId(int accountId) {
    for (var acc in accountsList) {
      if (accountId == acc.accountId) {
        return acc;
      }
    }
    // for (int i = 0; i < accountsList.length; i++) {
    //   if (accountId == accountsList[i].accountId) {
    //     return accountsList[i];
    //   }
    // }
    return null;
  }

  int accountId() {
    stdout.write('please enter account id: ');
    int accountId = int.parse(stdin.readLineSync()!);
    return accountId;
  }

  void indexShowAccountDetails() {
    /// search ==> return index
    int index = searchIndex(accountId());
    if (index == -1) {
      print('Invalid accountId.');
      return;
    }
    accountsList[index].view();
  }

  void valueShowAccountDetails() {
    /// search ==> return value
    var account = searchByAccountId(accountId());
    if (account == null) {
      print('Invalid accountId.');
      return;
    }
    account.view();
  }

  void deleteAccountIndex() {
    /// search ==> return index
    int index = searchIndex(accountId());
    if (index == -1) {
      print('Invalid accountId.');
      return;
    }
    accountsList.removeAt(index);
    clientsList.removeAt(index);
    print('==> account deleted successfully');
  }

  void deleteAccountValue() {
    /// search ==> return value
    var value = searchByAccountId(accountId());
    if (value == null) {
      print('Invalid accountId.');
      return;
    }
    accountsList.remove(value);
    clientsList.remove(value.owner);
    print('==> account deleted successfully');
  }

  void withdrawIndex() {
    /// search ==> return index
    int index = searchIndex(accountId());
    if (index == -1) {
      print('Invalid accountId.');
      return;
    }
    stdout.write('please enter amount to withdraw: ');
    double amount = double.parse(stdin.readLineSync()!);

    if (accountsList[index].withdraw(amount)) {
      print('==> Transaction successfully.');
    }
  }

  void withdrawValue() {
    /// search ==> return value
    var value = searchByAccountId(accountId());
    if (value == null) {
      print('Invalid accountId.');
      return;
    }
    stdout.write('please enter amount to withdraw: ');
    double amount = double.parse(stdin.readLineSync()!);
    if (value.withdraw(amount)) {
      print('==> Transaction successfully.');
    }
  }

  void depositIndex() {
    /// search ==> return index
    int index = searchIndex(accountId());
    if (index == -1) {
      print('Invalid accountId.');
      return;
    }
    stdout.write('please enter amount to deposit: ');
    double amount = double.parse(stdin.readLineSync()!);
    if (accountsList[index].deposit(amount)) {
      print('==> Transaction successfully.');
    }
  }

  void depositValue() {
    /// search ==> return value
    var value = searchByAccountId(accountId());
    if (value == null) {
      print('Invalid accountId.');
      return;
    }
    stdout.write('please enter amount to deposit: ');
    double amount = double.parse(stdin.readLineSync()!);
    if (value.deposit(amount)) {
      print('==> Transaction successfully.');
    }
  }

  void createAccount() {
    stdout.write('please enter your name: ');
    String name = stdin.readLineSync()!;
    stdout.write('please enter your phone number: ');
    String phone = stdin.readLineSync()!;
    stdout.write('please enter your address: ');
    String address = stdin.readLineSync()!;

    Client client = Client(name: name, phone: phone, address: address);

    stdout.write(
      'please choice Bank Type: \n 1. Bank Account. \n 2. Saving Bank Account.\n',
    );
    int bankType = int.parse(stdin.readLineSync()!);

    stdout.write('please enter balance: ');
    double balance = double.parse(stdin.readLineSync()!);

    late BankAccount bankAccount;

    if (bankType == 1) {
      bankAccount = BankAccount(balance: balance);
    } else if (bankType == 2) {
      bankAccount = SavingBankAccount(balance: balance);
    } else {
      print('Invalid Bank Type');
    }

    bankAccount.owner = client;
    client.account = bankAccount;

    accountsList.add(bankAccount);
    clientsList.add(client);
    print('==> account created successfully');
  }
}

void main() {
  BankingSystem bankingSystem = BankingSystem();
  bankingSystem.showMenu();
}
