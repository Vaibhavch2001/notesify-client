import 'dart:io';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
class pdfPage extends StatefulWidget {
  File file;
  pdfPage({this.file});
  @override
  _pdfPageState createState() => _pdfPageState();
}

class _pdfPageState extends State<pdfPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
              child: SfPdfViewer.file(widget.file,)),
        ));
  }
}
