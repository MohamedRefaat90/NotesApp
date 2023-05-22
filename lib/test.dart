import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
class Test extends StatelessWidget {
  Test({Key? key}) : super(key: key);
  var files;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Title'),
        ),
        body: Center(
          child: Column(
            children: [
              TextButton(
                  onPressed: () async {
                    FilePickerResult? result = await FilePicker.platform
                        .pickFiles(allowMultiple: true);

                    if (result != null) {
                      files = result.files.first;
                      print(files);
                    } else {
                      // User canceled the picker
                    }
                  },
                  child: Text("Pick")),
              TextButton(
                  onPressed: () async {
                    final newFile = await saveFile(files);
                  await  OpenFilex.open(newFile.path);
                  },
                  child: Text("open"))
            ],
          ),
        ));
  }
}

Future<File> saveFile(PlatformFile file)async{
  final Directory appDocumentsDir = await getApplicationDocumentsDirectory();

  final newFile = File('${appDocumentsDir.path}/${file.name}');

  return File(file.path!).copy(newFile.path);

}
