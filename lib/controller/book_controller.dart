import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookController extends GetxController {
  final CollectionReference _books =
      FirebaseFirestore.instance.collection('books');
  RxList<Map<String, dynamic>> books = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchBooks();
  }

  Future<void> fetchBooks() async {
    try {
      final snapshot = await _books.get();
      books.assignAll(snapshot.docs
          .map((doc) => {
                ...doc.data() as Map<String, dynamic>,
                'id': doc.id, // Assign the document ID to the 'id' field
              })
          .toList());
    } catch (e) {
      print('Error fetching books: $e');
    }
  }

  Future<void> addBook(String title, String author) async {
    try {
      await _books.add({'title': title, 'author': author});
      await fetchBooks();
    } catch (e) {
      print('the error : $e');
    }
    // Refresh the list after adding a book
  }

  Future<void> updateBook(
      String documentId, String title, String author) async {
    await _books.doc(documentId).update({'title': title, 'author': author});
    await fetchBooks(); // Refresh the list after updating a book
  }

  Future<void> deleteBook(Map<String, dynamic> book) async {
    final String documentId = book['id'];
    await _books.doc(documentId).delete();
    await fetchBooks(); // Refresh the list after deleting a book
  }
}
