import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:onlinebooks/app/data/model/response_model.dart';
import 'package:onlinebooks/app/data/repositories/book_upload.dart';
import 'package:onlinebooks/app/widgets/custom_snackbar.dart';
import 'package:path/path.dart';

class UploadbooksController extends GetxController {
  final formkey = GlobalKey<FormState>();
  TextEditingController bookname = TextEditingController();
  TextEditingController synposis = TextEditingController();
  RxBool selectCover = false.obs;
  RxBool selectfile = false.obs;
  RxBool uploadingBooks = false.obs;
  String filename = "";
  String categoryId = "1";

  String coverImage = '';
  File? coverFile;

  String pdf = '';
  File? pdfFile;

  @override
  void onInit() {
    super.onInit();
  }

  removeCover() {
    selectCover.value = false;
    coverImage = "";
    coverFile = null;
  }

  removeFile() {
    pdf = "";
    pdfFile = null;
    filename = "";
    selectfile.value = false;
  }

  pickCoverPhoto() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'jpg',
      ],
    );

    if (result != null) {
      coverImage = result.files.single.path!;
      coverFile = File(result.files.single.path!);
      selectCover.value = true;
    } else {
      // User canceled the picker
      selectCover.value = false;
    }
  }

  pickPdfFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'pdf',
        'doc',
      ],
    );

    if (result != null) {
      pdf = result.files.single.path!;
      pdfFile = File(result.files.single.path!);
      filename = basename(pdfFile!.path);
      selectfile.value = true;
    } else {
      // User canceled the picker
      selectfile.value = false;
    }
  }

  uploadBookData() async {
    uploadingBooks.toggle();

    if (formkey.currentState!.validate()) {
      ApiCall api = await bookUploadAPI.uploadbooks(
          bookname: bookname.text,
          categoryId: categoryId,
          synopsis: synposis.text,
          bookcover: coverFile!,
          bookfile: pdfFile!);

      if (api.status) {
        pdf = "";
        pdfFile = null;
        filename = "";
        selectfile.value = false;
        coverImage = "";
        coverFile = null;
        selectCover.value = false;
        bookname.text = "";
        synposis.text = "";
        customSnackbar(
            message: "Upload Book Successfully",
            backgroundColor: Colors.green,
            leadingIcon: Icons.check);
      } else {
        customSnackbar(message: api.message + " msg");
      }
    }

    uploadingBooks.toggle();
  }

  /*
   (String filename, String url) async {
  var request = http.MultipartRequest('POST', Uri.parse(url));
  request.files.add(
    await http.MultipartFile.fromPath(
      'pdf',
      filename
    )
  );
  var res = await request.send();
}
  
   */

  /*
  
  FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);

if (result != null) {
  List<File> files = result.paths.map((path) => File(path)).toList();
} else {
  // User canceled the picker
}
  
  
  
   */

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
