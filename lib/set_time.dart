import 'dart:async';
import 'package:flutter/material.dart';
import 'package:alert_dialog/alert_dialog.dart';
import 'package:google_fonts/google_fonts.dart';

class SetTime extends StatefulWidget {
  const SetTime({super.key});

  @override
  State<SetTime> createState() => _SetTimeState();
}

class _SetTimeState extends State<SetTime> {

  int minutes = 0;
  int hours = 0;
  int detik = 0;
  bool isPlay = true;
  late Timer waktu;
  final _jam = TextEditingController();
  final _menit = TextEditingController();
  final _dtk = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  void _waktuMulai(){
    hours = (int.tryParse(_jam.text) ?? 0);// digunakan untuk convert isi textfield string menjadi number
    minutes = (int.tryParse(_menit.text) ?? 0);// digunakan untuk convert isi textfield string menjadi number
    detik = (int.tryParse(_dtk.text) ?? 0);// digunakan untuk convert isi textfield string menjadi number
    waktu = Timer.periodic(const Duration(seconds: 1), (timer) { //proses pengurangan countdown timer
      setState(() {
        if (hours > 0) {
          hours--;
          minutes = 59;
          detik = 59;
        } else {
          if (minutes > 0) {
            minutes--;
            detik = 59;
          } else {
            if (detik > 0) {
              detik--;
            } else {
              isPlay = false;
              _waktuBerhenti();
              _popUpNotif();
            }
          }
        }
      });
    });
  }

  void _popUpNotif() { // digunakan untuk membuat aler notif pada saat timer selesai dengan menggunakan alertdialog
    AlertDialog alert = AlertDialog(
      title: Text("Informasi"),
      content: Container(
        child: Text("Waktu telah selesai!"),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Tutup'),
        ),
      ],
    );
    showDialog(context: context, builder: (context) => alert);
  }

  void _waktuBerhenti() {
    waktu.cancel();

    setState(() {
      isPlay = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Countdown Timer'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: _tampilanCountdownTimer()),
            _userInputAngka(),
            Expanded(child: _tombolAksi())
          ],
        )
    );
  }

  Widget _tampilanCountdownTimer(){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
              "Perhitungan CountDown Timer",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
          ),
          Text(
              '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${detik.toString().padLeft(2, '0')}', // merupakan tampilan untuk menamilkan 00:00:00 pada countdown timer
            //'$detik',
            style: GoogleFonts.orbit(
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _userInputAngka() { // digunakan untuk interaksi user dengan memasukan angka
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _jam,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Masukan waktu yang anda inginkan (jam)'),
              validator: (text) {
                if (text!.isEmpty){
                  return 'Masukan waktu';
                }
                return null;
              },
            ),
            SizedBox(width: 30),
            TextFormField(
              controller: _menit,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Masukan waktu yang anda inginkan (menit)'),
              validator: (text) {
                if (text!.isEmpty){
                  return 'Masukan waktu';
                }
                return null;
              },
            ),
            SizedBox(width: 30),
            TextFormField(
              controller: _dtk,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Masukan waktu yang anda inginkan (detik)'),
              validator: (text) {
                if (text!.isEmpty){
                  return 'Masukan waktu';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _tombolAksi() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 50),
        ElevatedButton(
            onPressed: () => _waktuMulai(),
            child: Text('Start')
        ),
        SizedBox(width: 50),
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          onPressed: () => _waktuBerhenti(),
          child: Text('Stop'),
        ),
      ],
    );
  }
}

