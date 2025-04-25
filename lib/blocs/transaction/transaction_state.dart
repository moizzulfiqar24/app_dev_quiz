import 'package:equatable/equatable.dart';
import '../../models/transaction_model.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();
  @override
  List<Object?> get props => [];
}

class TransactionLoading extends TransactionState {
  const TransactionLoading();
}

class TransactionLoaded extends TransactionState {
  final List<TransactionModel> transactions;
  const TransactionLoaded(this.transactions);
  @override
  List<Object?> get props => [transactions];
}

class TransactionError extends TransactionState {
  final String message;
  const TransactionError(this.message);
  @override
  List<Object?> get props => [message];
}
