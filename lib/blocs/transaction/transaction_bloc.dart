import 'package:flutter_bloc/flutter_bloc.dart';
import 'transaction_event.dart';
import 'transaction_state.dart';
import '../../repositories/transaction_repository.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final TransactionRepository _repo;

  TransactionBloc(this._repo) : super(const TransactionLoading()) {
    on<LoadTransactions>((_, emit) async {
      emit(const TransactionLoading());
      try {
        final items = await _repo.fetchTransactions();
        emit(TransactionLoaded(items));
      } catch (e) {
        emit(TransactionError(e.toString()));
      }
    });
  }
}
