import 'package:equatable/equatable.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();
  @override
  List<Object?> get props => [];
}

class LoadTransactions extends TransactionEvent {
  const LoadTransactions();
  @override
  List<Object?> get props => [];
}

// helper so we can write ..add(TransactionEvent.loadTransactions())
extension on TransactionEvent {
  static LoadTransactions loadTransactions() => const LoadTransactions();
}
