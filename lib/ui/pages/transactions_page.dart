import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../blocs/transaction/transaction_bloc.dart';
import '../../blocs/transaction/transaction_state.dart';
import '../widgets/transaction_list.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final weekday = DateFormat('EEEE').format(DateTime.now());
    final date = DateFormat('dd MMM').format(DateTime.now());

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: Column(
          children: [
            // ── Header ─────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  const BackButton(),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(weekday,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey)),
                        Text(date,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  BlocBuilder<TransactionBloc, TransactionState>(
                    builder: (context, state) {
                      double total = 0;
                      if (state is TransactionLoaded) {
                        total = state.transactions
                            .fold(0.0, (a, t) => a + t.amount);
                      }
                      final formatted =
                          NumberFormat.currency(symbol: '\$', decimalDigits: 0)
                              .format(total);
                      return Text(formatted,
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue));
                    },
                  ),
                ],
              ),
            ),

            // ── Transactions List Container ─────────────────
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                ),
                child: const TransactionList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
