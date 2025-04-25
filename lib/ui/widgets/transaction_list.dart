import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/transaction/transaction_bloc.dart';
import '../../blocs/transaction/transaction_state.dart';
import 'transaction_list_item.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionBloc, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is TransactionError) {
          return Center(child: Text('Error: ${state.message}'));
        }
        if (state is TransactionLoaded) {
          final txs = state.transactions;
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: txs.length,
            itemBuilder: (ctx, i) => TransactionListItem(transaction: txs[i]),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
