import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class FilePickerWidget extends StatefulWidget {
  final String label;
  final void Function(File) onPick;
  final File? file;
  const FilePickerWidget(
      {super.key, required this.label, required this.onPick, this.file});

  @override
  State<FilePickerWidget> createState() => _FilePickerWidgetState();
}

class _FilePickerWidgetState extends State<FilePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black45),
          ),
          GestureDetector(
            onTap: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                  allowedExtensions: ['jpg', 'png', 'jpeg'],
                  type: FileType.custom);

              if (result != null) {
                File file = File(result.files.single.path!);
                widget.onPick(file);
              }
            },
            child: Container(
              width: double.infinity,
              height: 100,
              margin: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.shade300,
                  border: Border.all(color: Colors.grey.shade400, width: 2)),
              child: Center(
                  child: widget.file != null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.file(widget.file!, height: 50),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(basename(widget.file!.path)),
                                  TextButton(
                                      onPressed: () async {
                                        FilePickerResult? result =
                                            await FilePicker.platform.pickFiles(
                                                allowedExtensions: [
                                              'jpg',
                                              'png',
                                              'jpeg'
                                            ],
                                                type: FileType.custom);

                                        if (result != null) {
                                          File file =
                                              File(result.files.single.path!);
                                          widget.onPick(file);
                                        }
                                      },
                                      child: const Text("Change"))
                                ],
                              ),
                            )
                          ],
                        )
                      : const Text(
                          "Select Image",
                          style: TextStyle(fontSize: 16),
                        )),
            ),
          )
        ],
      ),
    );
  }
}
