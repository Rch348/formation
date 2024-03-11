import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:show_pdf/main.dart';

class PdfViewerPage extends StatefulWidget 
{
  const PdfViewerPage({super.key});
  
  get file => null;

  @override
  State<PdfViewerPage> createState() => _PdfViewerPageState();

   Future<bool> saveFile(String url, String fileName) async 
   {
      try 
      {
         if (await _requestPermission(Permission.storage)) 
         {
            Directory? directory;
            directory = await getExternalStorageDirectory();
            String newPath = "";
            List<String> paths = directory!.path.split("/");
            for (int x = 1; x < paths.length; x++) 
            {
               String folder = paths[x];
               if (folder != "Android") 
               {
                  newPath += "/" + folder;
               } else 
               {
                  break;
               }
            }
            newPath = newPath + "/PDF_Download";
            directory = Directory(newPath);

            File saveFile = File(directory.path + "/$fileName");
            if (kDebugMode) 
            {
            print(saveFile.path);
            }
            if (!await directory.exists()) 
            {
               await directory.create(recursive: true);
            }
            if (await directory.exists()) 
            {
               await Dio().download
               (
                  url,
                  saveFile.path,
               );
            }
         }
         return true;
      } catch (e) 
      {
         return false;
      }
   }
}

class _PdfViewerPageState extends State<PdfViewerPage> 
{
   @override
   Widget build(BuildContext context) 
   {
      final name = basename(widget.file.path);
      return Scaffold
      (
         appBar: AppBar
         (
            title: Text(name),
            actions: [
            IconButton(
               onPressed: () async 
               {
                  await saveFile(widget.url, "sample.pdf");
                  ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                     content: Text(
                        'success',
                        style: TextStyle(color: Colors.white),
                     ),
                  ),
                  );
               },
               icon: const Icon(Icons.download_rounded),
            ),
            ],
         ),
         body: PDFView(
            filePath: widget.file.path,
         ),
      );
   }
}