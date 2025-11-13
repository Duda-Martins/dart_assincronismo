import 'package:dart_assincronismo/exceptions/transaction_excepitions.dart';
import 'package:dart_assincronismo/screens/account_screens.dart';
import 'package:dart_assincronismo/services/transaction_service.dart';

void main() {
  TransactionService().makeTransaction(
      idSender: "ID001",
      idReceiver: "ID002",
      amount: 5000,
  ).catchError(
    (e){
      print(e.message);
      print("${e.cause.name} possui saldo ${e.cause.balance} que é menor que ${e.amount + e.taxes}");
    },
    test: (error) => error is InsufficientFundsException,
  ).then(
    (value) {},
  );
}

// void main() async {
//   try {
//     await TransactionService().makeTransaction(
//         idSender: "ID001",
//         idReceiver: "ID002",
//         amount: 5000,
//     );
//     } on InsufficientFundsException catch (e) {
//         print(e.message);
//         print("${e.cause.name} possui saldo ${e.cause.balance} que é menor que ${e.amount + e.taxes}");
//     }

//   // AccountScreen accountScreen = AccountScreen();
//   // accountScreen.initializeStream();
//   // accountScreen.runChatBot();
// }