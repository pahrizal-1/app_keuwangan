import 'package:app_keuwangan/models/add_date.dart';
// ignore: unused_import
import 'package:app_keuwangan/ui/widgets/form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import '../widgets/backroud_add.dart';

class AddScreenPage extends StatefulWidget {
  const AddScreenPage({super.key});

  @override
  State<AddScreenPage> createState() => _AddScreenPageState();
}

class _AddScreenPageState extends State<AddScreenPage> {
  // ignore: non_constant_identifier_names
  final TextEditingController explain_controller = TextEditingController();
  // ignore: non_constant_identifier_names
  final TextEditingController amount_controller = TextEditingController();
  DateTime date = DateTime.now();
  final box = Hive.box<Add_data>('data');
  FocusNode ex = FocusNode();
  FocusNode amount_ = FocusNode();
  String? selectedItem;
  String? selectedItem1;

  final List<String> _item = ['Makanan', "Transfer", "Bayar Angkot", "Sekolah"];
  final List<String> _items1 = [
    "Penghasilan",
    "Pengeluaran",
  ];
  @override
  void initState() {
    super.initState();
    ex.addListener(() {
      setState(() {});
    });
    amount_.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
          child: Stack(
        alignment: AlignmentDirectional.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const BackRound(),
          main_container(),
        ],
      )),
    );
  }

  // ignore: non_constant_identifier_names
  Container main_container() {
    return Container(
      height: 550,
      width: 340,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          name(),
          const SizedBox(
            height: 30,
          ),
          explain(),
          const SizedBox(
            height: 30,
          ),
          amount(),
          const SizedBox(
            height: 30,
          ),
          how(),
          const SizedBox(
            height: 30,
          ),
          date_time(),
          const SizedBox(
            height: 40,
          ),
          save()
        ],
      ),
    );
  }

  Padding explain() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        focusNode: ex,
        controller: explain_controller,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: 'Catatan',
          labelStyle: GoogleFonts.poppins(
              fontSize: 15, color: Colors.black54, fontWeight: FontWeight.bold),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: Colors.grey.shade500)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 2, color: Colors.deepPurple),
          ),
        ),
      ),
    );
  }

  Padding amount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        keyboardType: TextInputType.number,
        focusNode: amount_,
        controller: amount_controller,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: 'Jumlah Uang',
          labelStyle: GoogleFonts.poppins(
              fontSize: 15, color: Colors.black54, fontWeight: FontWeight.bold),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: Colors.grey.shade500)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 2, color: Colors.deepPurple),
          ),
        ),
      ),
    );
  }

  GestureDetector save() {
    return GestureDetector(
      onTap: () {
        var add = Add_data(selectedItem1!, amount_controller.text, date,
            explain_controller.text, selectedItem!);
        box.add(add);
        Navigator.pop(context);
      },
      child: Container(
        width: 120,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.deepPurple,
        ),
        child: Text(
          'Simpan',
          style: GoogleFonts.poppins(
            fontSize: 17,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget date_time() {
    return Container(
      alignment: Alignment.bottomLeft,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2,
          color: Colors.grey.shade500,
        ),
      ),
      child: TextButton(
        onPressed: () async {
          DateTime? newDate = await showDatePicker(
              context: context,
              initialDate: date,
              firstDate: DateTime(2020),
              lastDate: DateTime(2100));
          if (newDate == null) return;
          setState(() {
            date = newDate;
          });
        },
        child: Text(
          'Tanggal : ${date.year}/ ${date.day}/ ${date.month}',
          style: GoogleFonts.poppins(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Padding how() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: 300,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: Colors.grey.shade500,
          ),
        ),
        child: DropdownButton<String>(
          value: selectedItem1,
          dropdownColor: Colors.white,
          isExpanded: true,
          underline: Container(),
          items: _items1
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 40,
                        child: Image.asset('assets/$e.png'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        e,
                        style: GoogleFonts.poppins(fontSize: 18),
                      )
                    ],
                  ),
                ),
              )
              .toList(),
          selectedItemBuilder: (BuildContext context) => _items1
              .map((e) => Row(
                    children: [
                      SizedBox(
                        width: 42,
                        child: Image.asset('assets/$e.png'),
                      ),
                      Text(e),
                    ],
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedItem1 = value!;
            });
          },
        ),
      ),
    );
  }

  Padding name() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: 300,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.only(top: 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: Colors.grey.shade400,
          ),
        ),
        child: DropdownButton<String>(
          value: selectedItem,
          hint: Text(
            'Keperluan',
            style: GoogleFonts.poppins(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
          dropdownColor: Colors.white,
          isExpanded: true,
          underline: Container(),
          items: _item
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 40,
                        child: Image.asset('assets/$e.png'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        e,
                        style: GoogleFonts.poppins(fontSize: 18),
                      )
                    ],
                  ),
                ),
              )
              .toList(),
          selectedItemBuilder: (BuildContext context) => _item
              .map((e) => Row(
                    children: [
                      SizedBox(
                        width: 42,
                        child: Image.asset('assets/$e.png'),
                      ),
                      Text(e),
                    ],
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedItem = value!;
            });
          },
        ),
      ),
    );
  }
}
