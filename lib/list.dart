// Credits For Ideas: Rendy

import 'package:flutter/material.dart';
import 'package:counter_7/model.dart';
import 'package:counter_7/drawer.dart';
import 'package:provider/provider.dart';

class ListBudget extends StatefulWidget {
  const ListBudget({super.key});

  @override
  State<ListBudget> createState() => _ListBudgetState();
}

class _ListBudgetState extends State<ListBudget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text('Form Budget'),
      ),
      drawer: const LabDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<BudgetModel>(builder: (context, value, child) {
          return ListView.builder( // Scrolling Widget
            itemCount: value.budgets.length, // banyak barang di List
            itemBuilder: ((context, index) {
              var item = value.budgets[index];

              return Card(
                elevation: 0,
                color: Theme.of(context).colorScheme.surfaceVariant,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.title, style: const TextStyle(fontSize: 26)),
                      const SizedBox(width: 300, height: 60),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item.nominal.toString()),
                          Text(item.type),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          );
        }),
      )
    );
  }
}