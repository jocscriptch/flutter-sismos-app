import 'package:flutter/material.dart';
import 'map.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late List<bool> _selections;

  @override
  void initState() {
    super.initState();
    _selections = [true, false];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Sismos'),
            bottom: const TabBar(
              indicatorColor: Colors.orange,
              tabs: [
                Tab(
                  text: 'MAPA',
                ),
                Tab(
                  text: 'LISTA',
                ),
              ],
            ),
            actions: [
              Container(
                padding: const EdgeInsets.only(right: 16.0),
                child: IconButton(
                  icon: const Icon(Icons.help_outline),
                  color: Colors.orange,
                  onPressed: () {},
                ),
              ),
            ],
          ),
          body: const TabBarView(
            children: [
              //  tab mapa
              MapTab(),
              // tab lista
              Center(
                child: Text('Lista'),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.orange[800],
            //alignment: MainAxisAlignment.spaceAround,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.radar),
                label: 'Sismo',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.record_voice_over),
                label: 'Lo sentiste?',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz),
                label: 'Más',
              ),
            ],
          ),
          bottomSheet: Container(
            color: Colors.grey[700],
            child: ToggleButtons(
              isSelected: _selections,
              onPressed: (int index) {
                setState(() {
                  _selections =
                      List.generate(_selections.length, (i) => i == index);
                });
              },
              fillColor: Colors.orange[800],
              selectedColor: Colors.white,
              color: Colors.white,
              borderRadius: BorderRadius.circular(2.0),
              borderWidth: 1,
              children: const [
                Row(
                  children: [
                    Text('24 horas'),
                    SizedBox(width: 10),
                    Icon(Icons.restart_alt_sharp),
                  ],
                ),
                Row(
                  children: [
                    Text('15 días'),
                    SizedBox(width: 10),
                    Icon(Icons.calendar_month),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
