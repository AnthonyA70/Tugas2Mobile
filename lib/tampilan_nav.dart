import 'package:flutter/material.dart';
import 'package:tugas2anthony/set_time.dart';
import 'package:tugas2anthony/stopwatch.dart';
import 'package:tugas2anthony/tentang_saya.dart';

class TampilanNavbar extends StatefulWidget {
  final String name;
  final String email;

  const TampilanNavbar({Key? key, required this.name, required this.email})
      : super(key: key);

  @override
  _TampilanNavbarState createState() => _TampilanNavbarState();
}

class _TampilanNavbarState extends State<TampilanNavbar> {

  int cIndex = 0;

  @override
  Widget build(BuildContext context) {

    final _inputKomponenLain = <Widget>[ // memiliki fungsi untuk memanggil komponen yang sudah di buat
      StopWatch(),
      SetTime(),
      TentangSaya()
    ];

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Bottom Nav'),
      // ),
      body: SizedBox.expand(
        child: _inputKomponenLain[cIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: cIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.timer),
              label: 'Stopwatch',
              backgroundColor: Colors.blueAccent
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.timelapse),
              label: 'Countdown',
              backgroundColor: Colors.blueAccent
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'About',
              backgroundColor: Colors.blueAccent
          ),
        ],
        onTap: (index) { //untuk memproses clik dalam navigation
          setState(() {
            cIndex = index;
          });
        },
      ),
    );
  }
}
