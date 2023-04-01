import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:excel/excel.dart';
import 'dart:io';
import 'package:path/path.dart';


class ExcelPage extends StatefulWidget {
  @override
  _ExcelPageState createState() => _ExcelPageState();
}

class _ExcelPageState extends State<ExcelPage> {
  List<List<dynamic>> excelData = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadDataFromExcel();
  }

  Future<void> loadDataFromExcel() async {
    ByteData data;
    try {
      data = await rootBundle.load('store/oromo.xlsx');
    } catch (e) {
      print('Failed to load Excel file: $e');
      return;
    }

    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel;
    try {
      excel = Excel.decodeBytes(bytes);
    } catch (e) {
      print('Failed to decode Excel file: $e');
      return;
    }

    for (var table in excel.tables.keys) {
      excelData.add(excel.tables[table].rows);
    }
    setState(() {
        
        loading = false;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Excel Data'),
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: excelData.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        'Table ${index + 1}:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    DataTable(
                      columns: excelData[index]
                          .map(
                            (header) => DataColumn(
                              label: Text(
                                header.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                          .toList(),
                      rows: excelData[index].sublist(1).map((row) {
                        return DataRow(
                          cells: [DataCell(Text(row.toString()))]
                        );
                      }).toList(),
                    ),
                    Divider(height: 24),
                  ],
                );
              },
            ),
    );
  }
}
