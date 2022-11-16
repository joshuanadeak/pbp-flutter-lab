// Credits For Ideas: Rendy

import 'package:flutter/material.dart';
import 'package:counter_7/model.dart';
import 'package:counter_7/drawer.dart';
import 'package:provider/provider.dart';

class FormBudget extends StatefulWidget {
  const FormBudget({super.key});

  @override
  State<FormBudget> createState() => _FormBudgetState();
}

class _FormBudgetState extends State<FormBudget> {
  final _formKey = GlobalKey<FormState>();
  String title = "";
  String? type;
  int nominal = 0;
  List<String> listKind = [
    "Pengeluaran",
    "Pemasukan"
  ];
  DateTime date = DateTime.now();

  void submitForm(BuildContext context) {
    if(!_formKey.currentState!.validate()) {
      return;
    }

    final newBudget = Budget(title, nominal, type!);
    Provider.of<BudgetModel>(context, listen: false).add(newBudget);

    const snackBar = SnackBar(
      content: Text('Data Has Been Added!'),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Budget'),
      ),
      drawer: const LabDrawer(),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Title",
                    hintText: "Buying McDonald's",
                    icon: const Icon(Icons.title),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                  setState(() { title = value!; });
                  },
                  onSaved: (String? value) {
                  setState(() { title = value!; });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                        return 'Input Can`t Be Empty!';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Nominal",
                    hintText: "131313",
                    icon: const Icon(Icons.title),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // Menambahkan behavior saat nama diketik 
                  onChanged: (String? value) {
                  setState(() { nominal = int.parse(value!); });
                  },
                  onSaved: (String? value) {
                  setState(() { nominal = int.parse(value!); });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Nominal Can`t Be Empty!';
                    } else if (int.tryParse(value) == null) {
                      return 'Nominal Is Invalid!';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField(
                value: type,
                icon: const Icon(Icons.arrow_drop_down),
                hint: const Text("Type Options"),
                items: listKind.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    type = newValue!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Pick One Type!";
                  }

                  return null;
                },
              ),
              const Spacer(), // Beri jarak dengan Button
              TextButton(
                onPressed: () => submitForm(context),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color.fromARGB(255, 219, 97, 89)),
                    foregroundColor: MaterialStateProperty.all(Colors.white)),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("Save"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}