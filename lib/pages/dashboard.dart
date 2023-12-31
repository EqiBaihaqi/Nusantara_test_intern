import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nusantara_test/controller/auth_controller.dart';
import 'package:nusantara_test/controller/book_controller.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    final BookController bookController = Get.put(BookController());

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[500],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Welcome $email'),
            ElevatedButton(
              onPressed: () {
                AuthController.instance.logout();
              },
              child: const Icon(Icons.logout),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Books',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: bookController.books.length,
                  itemBuilder: (context, index) {
                    final book = bookController.books[index];

                    return ListTile(
                      title: Text(book['title'] ?? ''),
                      subtitle: Text(book['author'] ?? ''),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              _showEditBookDialog(
                                  context, bookController, index);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              bookController
                                  .deleteBook(bookController.books[index]);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddBookDialog(context, bookController);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _showAddBookDialog(
      BuildContext context, BookController bookController) async {
    String title = '';
    String author = '';

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Book'),
        content: Column(
          children: [
            TextField(
              onChanged: (value) => title = value,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              onChanged: (value) => author = value,
              decoration: const InputDecoration(labelText: 'Author'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              await bookController.addBook(title, author);
              Get.back();
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  Future<void> _showEditBookDialog(
      BuildContext context, BookController bookController, int index) async {
    String title = bookController.books[index]['title'] ?? '';
    String author = bookController.books[index]['author'] ?? '';
    String documentId =
        bookController.books[index]['id']; // Get the document ID

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Book'),
        content: Column(
          children: [
            TextField(
              onChanged: (value) => title = value,
              decoration: InputDecoration(
                  labelText: 'Title',
                  hintText: bookController.books[index]['title'] ?? ''),
            ),
            TextField(
              onChanged: (value) => author = value,
              decoration: InputDecoration(
                  labelText: 'Author',
                  hintText: bookController.books[index]['author'] ?? ''),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              await bookController.updateBook(documentId, title, author);
              Get.back();
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
