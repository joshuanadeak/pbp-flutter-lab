// Credits For Ideas: Rendy

import 'package:flutter/material.dart';
import 'package:counter_7/page/form.dart';
import 'package:counter_7/page/list.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/page/mywatchlistpage.dart';

class LabDrawer extends StatefulWidget {
  const LabDrawer({super.key});

  @override
  State<LabDrawer> createState() => _LabDrawerState();
}

class _LabDrawerState extends State<LabDrawer> {
  // root from drawer
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ListTile(
            title: const Text("counter_7"),
            onTap: () {
              Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const MyHomePage(title: "Program Counter"),
                ), 
              );
            },
          ),
          ListTile(
            title: const Text("Tambah Budget"),
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => const FormBudget()),
              );
            },
          ),
          ListTile(
            title: const Text("Data Budget"),
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => const ListBudget()),
              );
            },
          ),
          ListTile(
            title: const Text('My Watch List'),
            onTap: () {
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyWatchlistPage()),
              );
            },
          ),
        ]
      )
    );
  }
}