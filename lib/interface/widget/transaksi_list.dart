import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:moneymanager/const.dart';
import 'package:moneymanager/manage/interface.dart';
import 'package:moneymanager/interface/widget/transaksi_card.dart';
import 'package:moneymanager/interface/widget/empty.dart';

class TransactionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiManager = Provider.of<UiManager>(context);
    final groupedTransactions = uiManager.groupedTransactionsByDate;

    final length = groupedTransactions.length;
    return length == 0
        ? EmptyListWidget(
      textToDisplay: kEmptyList,
    )
        : ListView.builder(
      itemBuilder: (_, index) {
        return TransactionsCard(groupedTransactions[index]);
      },
      itemCount: length,
    );
  }
}
