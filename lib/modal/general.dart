import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyExcel(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyExcel extends StatefulWidget {
  const MyExcel({super.key, required this.title});

  final String title;

  @override
  State<MyExcel> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyExcel> {
  int _counter = 0;

  List<String?> general = [];
  List<String?> lifeHack = [];
  List<String?> animals = [];
  List<String?> sport = [];
  List<String?> science = [];
  List<String?> sex = [];
  List<String?> humanBiology = [];
  List<String?> universe = [];

  @override
  void initState() {
    _readExcel(true);
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _readExcel(bool isAmharic) async {
    var file = 'assets/data.xlsx';
    ByteData data = await rootBundle.load(file);
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);

    Sheet amharic = excel.tables["Amharic"]!;
    Sheet oromo = excel.tables["Oromo"]!;
    Sheet selectedSheet = isAmharic ? amharic : oromo;

    for (var i = 0; i < selectedSheet.maxRows; i++) {
      general.add(selectedSheet.rows[i][0]?.value.toString());
      lifeHack.add(selectedSheet.rows[i][1]?.value.toString());
      animals.add(selectedSheet.rows[i][2]?.value.toString());
      sport.add(selectedSheet.rows[i][3]?.value.toString());
      science.add(selectedSheet.rows[i][4]?.value.toString());
      // sex.add(amharic.rows[0][i]?.value.toString());
      // humanBiology.add(amharic.rows[0][i]?.value.toString());
      // universe.add(amharic.rows[0][i]?.value.toString());
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Lists',
                ),

                getCategoryList('General', general),
                getCategoryList('LifeHack', lifeHack),
                getCategoryList('Animals', animals),
                getCategoryList('Science', science),
                // getCategoryList('Sport', sport),
                // getCategoryList('Sex', sex),
                // getCategoryList('universe', universe),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Card getCategoryList(String title, List<String?> data) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Category: $title'),
            for (int i = 0; i < data.length; i++)
              Column(
                children: [
                  ListTile(
                    title: Text(
                      '${data[i]}',
                    ),
                    leading: Text('#$i'),
                  ),
                  const Divider()
                ],
              ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
