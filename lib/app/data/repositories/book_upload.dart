import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:onlinebooks/app/constant/api_link.dart';
import 'package:onlinebooks/app/constant/controller.dart';
import 'package:onlinebooks/app/data/model/response_model.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

BookAPI bookUploadAPI = BookAPI();

///it call all user related work
class BookAPI {
  Future<ApiCall> uploadbooks(
      {required String bookname,
      required String categoryId,
      required String synopsis,
      required File bookcover,
      required File bookfile}) async {
    ApiCall userapi = ApiCall(message: '', status: false);

    try {
      var uri = Uri.parse(Api.uploadbook);

      // create multipart request
      var request = http.MultipartRequest("POST", uri);

      final header = {"token": appController.accesstoken};

      String filebook = bookfile.path.split('/').last;
      String image = bookcover.path.split('/').last;
      var formData = FormData.fromMap({
        "title": bookname,
        "category_id": "1",
        "synopsis": synopsis,
        "cover_image":
            await MultipartFile.fromFile(bookcover.path, filename: image),
        "pdf_file":
            await MultipartFile.fromFile(bookfile.path, filename: filebook),
      });
      Dio dio = Dio();
      //"token": appController.accesstoken
      dio.options.headers["token"] = appController.accesstoken;
      var response = await dio.post(Api.uploadbook, data: formData);
      print(response);

      // var stream = http.ByteStream(bookcover.openRead());
      // stream.cast();
      // // get file length
      // var length = await bookcover.length(); //imageFile is your image file

      // // multipart that takes file
      // var multipartFileSign = http.MultipartFile('cover_image', stream, length,
      //     filename: basename(bookcover.path));

      // var pdf = http.ByteStream(bookfile.openRead());
      // pdf.cast();
      // // get file length
      // var pdflength = await bookfile.length(); //imageFile is your image file

      // // multipart that takes file
      // var pdfmultipartFileSign = http.MultipartFile('pdf_file', pdf, pdflength,
      //     filename: basename(bookfile.path));

      // //add headers
      // request.headers.addAll(header);
      // request.files.add(multipartFileSign);
      // request.files.add(pdfmultipartFileSign);
      // request.fields['category_id'] = "1";
      // request.fields['synopsis'] = synopsis;
      // request.fields['title'] = bookname;
      // request.headers.addAll(header);

      // // send
      // var response = await request.send();

      // print(response.statusCode);

      // // listen for response
      // response.stream.transform(utf8.decoder).listen((value) {
      //   print(value);
      // });

      ///------------------------------------
      // print(header);

      // print(bookfile.path);
      // var coverimage = await http.MultipartFile.fromPath(
      //     "cover_image", bookcover.readAsBytes(),
      //     filename: bookcover.path.split("/").last.replaceAll(" ", "_"));
      // var pdf = await http.MultipartFile.fromPath("pdf_file", bookfile.path,
      //     filename: bookfile.path.split("/").last.replaceAll(" ", "_"));
      // request.files.add(coverimage);
      // request.files.add(pdf);
      // request.fields['category_id'] = "1";
      // request.fields['synopsis'] = synopsis;
      // request.fields['title'] = bookname;
      // request.headers.addAll(header);

      // var response = await request.send();
      // var responsed = await http.Response.fromStream(response);
      // final responseData = json.decode(responsed.body);
      // print(responseData);
      // print(response.statusCode);

//
    } catch (e) {
      userapi.status = false;
      print(e);
      userapi.message = e.toString();
    }
    return userapi;
  }
}
/*

uploadFile() async {
    var postUri = Uri.parse("<APIUrl>");
    var request = new http.MultipartRequest("POST", postUri);
    request.fields['user'] = 'blah';
    request.files.add(new http.MultipartFile.fromBytes('file', await File.fromUri("<path/to/file>").readAsBytes(), contentType: new MediaType('image', 'jpeg')))

    request.send().then((response) {
      if (response.statusCode == 200) print("Uploaded!");
    });
  } */
