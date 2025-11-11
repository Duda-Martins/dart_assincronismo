import 'package:dart_assincronismo/screens/account_screens.dart';
import 'package:dart_assincronismo/services/transaction_service.dart';

void main() {
  TransactionService().makeTransaction(
    idSender: "ID001",
    idReceiver: "ID003",
    amount: 50,
  );

  // AccountScreen accountScreen = AccountScreen();
  // accountScreen.initializeStream();
  // accountScreen.runChatBot();
}