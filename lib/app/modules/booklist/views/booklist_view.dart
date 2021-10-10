import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/booklist_controller.dart';

class BooklistView extends GetView<BooklistController> {
  const BooklistView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BooklistView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BooklistView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
