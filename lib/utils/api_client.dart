import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mynitfinal/models/books.dart';
import 'package:mynitfinal/models/notes.dart';
import 'package:mynitfinal/models/pastPapers.dart';
import 'package:mynitfinal/models/slides.dart';
import 'package:mynitfinal/models/subjects.dart';

class ApiClient {
  final String baseUrl = 'https://vaibhav-nodejs-notesify.herokuapp.com/';
  Future<dynamic> addBook(String url, String name, int subjectId) async {
    final http.Response response = await http.post(
      baseUrl + 'books/add',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, dynamic>{"SubjectId": subjectId, "name": name, "link": url}),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return (response.statusCode);
    } else {
      throw Exception('http API Post Call Failed');
    }
  }

  Future<List<Book>> getBooks(int subjectId) async {
    final http.Response response = await http.post(
      baseUrl + 'books/get',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{"SubjectId": subjectId}),
    );
    if (response.statusCode == 200) {
      print(response.body);
      List<Book> list = [];
      var body = json.decode(response.body);
      for (int i = 0; i < body.length; i++) {
        Book item = Book.fromJson(body[i]);
        list.add(item);
      }
      return list;
    } else {
      throw Exception('http API Post Call Failed');
    }
  }

  Future<List<Subject>> getSubjectsByBranchAndSem(
      String branch, String sem) async {
    final http.Response response = await http.post(
      baseUrl + 'subjects/bySemAndBranch',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{"semester": sem, "branch": branch}),
    );
    if (response.statusCode == 200) {
      print(response.body);
      List<Subject> list = [];
      var body = json.decode(response.body);
      for (int i = 0; i < body.length; i++) {
        Subject item = Subject.fromJson(body[i]);
        list.add(item);
      }
      return list;
    } else {
      throw Exception('http API Post Call Failed');
    }
  }

  Future<List<Slide>> getSlides(int subjectId) async {
    final http.Response response = await http.post(
      baseUrl + 'slides/get',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{"SubjectId": subjectId}),
    );
    if (response.statusCode == 200) {
      print(response.body);
      List<Slide> list = [];
      var body = json.decode(response.body);
      for (int i = 0; i < body.length; i++) {
        Slide item = Slide.fromJson(body[i]);
        list.add(item);
      }
      return list;
    } else {
      throw Exception('http API Post Call Failed');
    }
  }

  Future<dynamic> addSlide(int subjectId, String name, String url) async {
    final http.Response response = await http.post(
      baseUrl + 'slides/add',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, dynamic>{"SubjectId": subjectId, "name": name, "link": url}),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return (response.statusCode);
    } else {
      throw Exception('http API Post Call Failed');
    }
  }

  Future<List<Note>> getNotes(int subjectId) async {
    final http.Response response = await http.post(
      baseUrl + 'notes/get',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{"SubjectId": subjectId}),
    );
    if (response.statusCode == 200) {
      print(response.body);
      List<Note> list = [];
      var body = json.decode(response.body);
      for (int i = 0; i < body.length; i++) {
        Note item = Note.fromJson(body[i]);
        list.add(item);
      }
      return list;
    } else {
      throw Exception('http API Post Call Failed');
    }
  }

  Future<dynamic> addNotes(int subjectId, String name, String url) async {
    final http.Response response = await http.post(
      baseUrl + 'notes/add',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, dynamic>{"SubjectId": subjectId, "name": name, "link": url}),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return (response.statusCode);
    } else {
      throw Exception('http API Post Call Failed');
    }
  }

  Future<List<PastPaper>> getPastPapers(int subjectId) async {
    final http.Response response = await http.post(
      baseUrl + 'pastPapers/get',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{"SubjectId": subjectId}),
    );
    if (response.statusCode == 200) {
      print(response.body);
      List<PastPaper> list = [];
      var body = json.decode(response.body);
      for (int i = 0; i < body.length; i++) {
        PastPaper item = PastPaper.fromJson(body[i]);
        list.add(item);
      }
      return list;
    } else {
      throw Exception('http API Post Call Failed');
    }
  }

  Future<dynamic> addPastPapers(int subjectId, String name, String url) async {
    final http.Response response = await http.post(
      baseUrl + 'pastPapers/add',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, dynamic>{"SubjectId": subjectId, "name": name, "link": url}),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return (response.statusCode);
    } else {
      throw Exception('http API Post Call Failed');
    }
  }
}
