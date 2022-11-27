import 'package:app_keuwangan/models/add_date.dart';
import 'package:app_keuwangan/models/uninyty.dart';
import 'package:app_keuwangan/ui/widgets/chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/listdata.dart';

import '../../models/top.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  List day = ['Hari', 'Mingguan', 'Bulan', 'Tahun'];
  List f = [today(), week(), mounth(), year()];
  List<Add_data> a = [];
  ValueNotifier kj = ValueNotifier(0);

  int color = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: kj,
        builder: (context, dynamic value, child) {
          a = f[value];
          return costum();
        },
      )),
    );
  }

  CustomScrollView costum() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              // ignore: prefer_const_constructors
              SizedBox(
                height: 20,
              ),
              Text(
                'Statiscs',
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(
                      4,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              color = index;
                              kj.value = index;
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 90,
                            decoration: BoxDecoration(
                              color: color == index
                                  ? Colors.deepPurple
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              day[index],
                              style: GoogleFonts.poppins(
                                color: color == index
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Expense',
                            style: GoogleFonts.poppins(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Icon(
                            Icons.arrow_downward_sharp,
                            size: 15,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Chart(
                indexx: color,
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top Spending',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(
                      Icons.swap_vert,
                      color: Colors.grey,
                      size: 25,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    'assets/${a[index].name}.png',
                    height: 40,
                  ),
                ),
                title: Text(
                  a[index].name,
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  '${day[a[index].datetime.weekday - 1]} ${a[index].datetime.year}-${a[index].datetime.day}-${a[index].datetime.month}',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: Text(
                  '\$ ${a[index].amount}',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: a[index].iN == 'Penghasilan'
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
              );
            },
            childCount: a.length,
          ),
        )
      ],
    );
  }
}
                  // '${day[a[index].datetime.weekday - 1]} ${a[index].datetime.year}-${a[index].datetime.day}-${a[index].datetime.month}',
// 