import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:excel/excel.dart';
import 'package:pdf/widgets.dart' as pw;

void main() => runApp(MaterialApp(home: ExcelToPdfApp()));

class ExcelToPdfApp extends StatelessWidget {
  
  // دالة اختيار الملف وتحويله
  Future<void> pickAndConvert() async {
    // 1. يفتح نافذة اختيار الملفات
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      var bytes = file.readAsBytesSync();
      var excel = Excel.decodeBytes(bytes);
      final pdf = pw.Document();

      // 2. نفس منطق التحويل اللي قلناه
      for (var table in excel.tables.keys) {
        pdf.addPage(pw.Page(build: (context) {
          return pw.TableHelper.fromTextArray(
            data: excel.tables[table]!.rows.map((row) {
              return row.map((cell) => cell?.value.toString() ?? "").toList();
            }).toList(),
          );
        }));
      }

      // 3. حفظ الملف الجديد في نفس مكان القديم بس بصيغة pdf
      final output = File(file.path.replaceFirst(".xlsx", ".pdf"));
      await output.writeAsBytes(await pdf.save());
      
      print("تم الحفظ في: ${output.path}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("محول إكسيل لـ PDF")),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: pickAndConvert, 
          icon: Icon(Icons.upload_file),
          label: Text("اختار ملف الإكسيل وابدأ التحويل"),
        ),
      ),
    );
  }
}