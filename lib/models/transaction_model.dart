import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionModel {
  final String id;
  final DateTime date;
  final String type;
  final double amount;

  TransactionModel({
    required this.id,
    required this.date,
    required this.type,
    required this.amount,
  });

  factory TransactionModel.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return TransactionModel(
      id: doc.id,
      date: (data['date'] as Timestamp).toDate(),
      type: data['type'] as String,
      amount: (data['amount'] as num).toDouble(),
    );
  }
}
