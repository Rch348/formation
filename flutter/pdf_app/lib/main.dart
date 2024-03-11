import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart' as pdf;
import 'package:pdf/widgets.dart' as pdfWidget;
import 'package:pdf_app/pdf_editor_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Flutter Edit Pdf Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({key, required this.title}) : super(key: key);

  

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _edit() async {
    PdfMutableDocument doc = await PdfMutableDocument.asset("assets/test.pdf");
    _editDocument(doc);
    await doc.save(filename: "modified.pdf");
    print("PDF Edition Done");
  }

  void _editDocument(PdfMutableDocument document) {
    var page = document.getPage(0);
    page.add(item: pdfWidget.Positioned(
      left: 0.0,
      top: 0.0,
      child: pdfWidget.Text("COUCOU",
          style: const pdfWidget.TextStyle(fontSize: 32, color: pdf.PdfColors.red)),
    ));
    var centeredText = pdfWidget.Center(
        child: pdfWidget.Text(
      "CENTERED TEXT",
      style: const pdfWidget.TextStyle(
          fontSize: 40,
          color: pdf.PdfColors.green,
          background: pdfWidget.BoxDecoration(color: pdf.PdfColors.amber)),
    ));
    page.add(item: centeredText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _edit,
        tooltip: 'Load',
        icon: const Icon(Icons.file_download),
        label: const Text("Modify"),
      ),
    );
  }
}