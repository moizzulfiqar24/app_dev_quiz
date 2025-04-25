import 'package:flutter/material.dart';
import '../../models/transaction_model.dart';
import '../../utils/date_utils.dart';

class TransactionListItem extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionListItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    // choose an icon based on type
    const iconMap = {
      'Shopping': Icons.shopping_bag,
      'Grocery': Icons.local_grocery_store,
      'Transport': Icons.directions_car,
      'Payment': Icons.credit_card,
    };
    final icon = iconMap[transaction.type] ?? Icons.person;
    final isPositive = transaction.amount >= 0;
    final amtString =
        '${isPositive ? '+' : '-'}\$${transaction.amount.abs().toStringAsFixed(0)}';

    return ListTile(
      leading: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: Colors.blue),
      ),
      title: Text(
        transaction.type,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        humanDate(transaction.date),
        style: const TextStyle(color: Colors.grey, fontSize: 12),
      ),
      trailing: Text(
        amtString,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isPositive ? Colors.blue : Colors.red,
        ),
      ),
    );
  }
}
