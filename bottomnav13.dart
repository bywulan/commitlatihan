import 'package:bywulan/day8/stack.dart';
import 'package:bywulan/day9/day11/tugasflutter6.dart';
import 'package:bywulan/day_17/service/preference_handler.dart';
import 'package:bywulan/day_6/expanded.dart';
import 'package:bywulan/extension/navigator.dart';
import 'package:flutter/material.dart';

class Bottomnav13 extends StatefulWidget {
  const Bottomnav13({super.key});

  @override
  State<Bottomnav13> createState() => _Bottomnav13State();
}

class _Bottomnav13State extends State<Bottomnav13> {
  int _selectedBottom = 0;
  void changeBottom(int index) {
    _selectedBottom = index;
    print("Ini adalah value dari $_selectedBottom");
    setState(() {});
  }

  final List<Widget> _widgetOptions = [
    ExpandedDay6(),
    StackDay8(),
    LogoutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          changeBottom(value);
        },
        currentIndex: _selectedBottom,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "School"),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: "Business",
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedBottom),
    );
  }
}

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // 1. Menghapus session status login di SharedPreferences lokal.
        PreferenceHandler.logout();

        // 2. Mengarahkan pengguna kembali ke halaman LoginDay17 serta menghapus seluruh tumpukan navigasi sebelumnya (pushAndRemoveAll).        // 2. Mengarahkan pengguna kembali ke halaman LoginDay17 serta menghapus seluruh tumpukan navigasi sebelumnya (pushAndRemoveAll).
        context.pushAndRemoveAll(const tugasflutter6());
      },
      child: const Center(child: Icon(Icons.logout, size: 48)),
    );
  }
}
