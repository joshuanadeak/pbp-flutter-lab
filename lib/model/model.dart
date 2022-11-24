// Credits For Ideas: Rendy

import 'package:flutter/material.dart';
import 'dart:collection';

class Budget {
  const Budget(this.title, this.nominal, this.type, this.date);

  final String title;
  final String type;
  final int nominal;
  final DateTime date;
}

class BudgetModel extends ChangeNotifier {
  final List<Budget> _budgets = []; // Utilizing List Data Structure

  UnmodifiableListView<Budget> get budgets => UnmodifiableListView(_budgets);

  void add(Budget budget) {
    _budgets.add(budget);
  }
}