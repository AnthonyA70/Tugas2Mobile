import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TentangSaya extends StatefulWidget {
  @override
  State<TentangSaya> createState() => _TentangSayaState();
}

class _TentangSayaState extends State<TentangSaya> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: _logoSI()),
          Expanded(child: _identitasAbout()),
          Expanded(child: _logoFTI())
        ],
      ),
    );
  }

  Widget _logoFTI() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'assets/FTI UNTAR.png', width: 164, height: 60,
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
          ),
          Image.asset(
            'assets/Logo SI clear.png', width: 164, height: 70,
          ),
        ],
      ),
    );
  }

  Widget _identitasAbout() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '==========================================='
          ),
          Icon(
              Icons.school
          ),
          Padding(
            padding: EdgeInsets.all(30.0),
          ),
          Text(
            'Anthony | 825210070',
            style: GoogleFonts.notoSans(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30.0),
          ),
          Icon(
              Icons.school
          ),
          Text(
              '==========================================='
          ),
        ],
      ),
    );
  }

  Widget _logoSI() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
              'assets/Logo SI clear.png', width: 164, height: 70,
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
          ),
          Image.asset(
            'assets/FTI UNTAR.png', width: 164, height: 60,
          ),
        ],
      ),
    );
  }

}
