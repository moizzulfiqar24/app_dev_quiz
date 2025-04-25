import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/transaction_model.dart';

class TransactionRepository {
  final FirebaseFirestore _firestore;
  TransactionRepository(this._firestore);

  Future<List<TransactionModel>> fetchTransactions() async {
    final snap = await _firestore
        .collection('transactions')
        .orderBy('date', descending: true)
        .get();
    return snap.docs.map((doc) => TransactionModel.fromDoc(doc)).toList();
  }
}
