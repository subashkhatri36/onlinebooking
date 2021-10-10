import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/booklist_controller.dart';

class BooklistView extends GetView<BooklistController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BooklistView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'BooklistView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
