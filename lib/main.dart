import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'blocs/transaction/transaction_event.dart';
import 'repositories/transaction_repository.dart';
import 'blocs/transaction/transaction_bloc.dart';
import 'ui/pages/transactions_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => TransactionRepository(FirebaseFirestore.instance),
      child: BlocProvider(
        create: (ctx) => TransactionBloc(ctx.read<TransactionRepository>())
          ..add(const LoadTransactions()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const TransactionsPage(),
        ),
      ),
    );
  }
}
