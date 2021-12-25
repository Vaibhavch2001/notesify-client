import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:mynitfinal/models/books.dart';
import 'package:mynitfinal/models/notes.dart';
import 'package:mynitfinal/models/old_books.dart';
import 'package:mynitfinal/models/pastPapers.dart';
import 'package:mynitfinal/models/slides.dart';
import 'package:mynitfinal/models/subjects.dart';
import 'package:mynitfinal/utils/constants.dart';

class ApiClient {

  //AUTHENTICATION

  static Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
  Future getCurrentUser() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User _user = auth.currentUser;
    print("User: ${_user != null ? _user.displayName : "None"}");
    Constant.USER = _user;
    return _user==null ? "NULL":_user;
  }
  static Future<User> signInWithGoogle({BuildContext context}) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  User user;

  final GoogleSignIn googleSignIn = GoogleSignIn();

  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();

  if (googleSignInAccount != null) {
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    try {
      final UserCredential userCredential =
      await auth.signInWithCredential(credential);

      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
    if (e.code == 'account-exists-with-different-credential') {
    // handle the error here
    }
    else if (e.code == 'invalid-credential') {
    // handle the error here
    }
    } catch (e) {
    // handle the error here
    }
  }
  Constant.USER = user;
  return user;
  }
  static Future<void> signOut({BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
        await googleSignIn.signOut();
      await FirebaseAuth.instance.signOut();
    } catch (e) {
    }
  }

  // BACKEND APIs

  final String baseUrl = 'https://vaibhav-nodejs-notesify.herokuapp.com/';
//  final String baseUrl = 'http://localhost:8080/';

  Future<dynamic> getAllListings() async {
    final http.Response response = await http.get(
      baseUrl + 'old-books/all',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }
    );
    if (response.statusCode == 200) {
      print(response.body);
      List<OldBook> list = [];
      var body = json.decode(response.body);
      for (int i = 0; i < body.length; i++) {
        OldBook item = OldBook.fromJson(body[i]);
        list.add(item);
      }
      return list;
    } else {
      throw Exception('http API Post Call Failed');
    }
  }

  Future<List<OldBook>> getMyListings() async {
    final http.Response response = await http.post(
        baseUrl + 'old-books/my',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{"sellerEmail": Constant.USER.email}),
    );
    if (response.statusCode == 200) {
      print(response.body);
      List<OldBook> list = [];
      var body = json.decode(response.body);
      for (int i = 0; i < body.length; i++) {
        OldBook item = OldBook.fromJson(body[i]);
        list.add(item);
      }
      return list;
    } else {
      throw Exception('http API Post Call Failed');
    }
  }

  Future<dynamic> addListing(String url, String name, int subjectId, OldBook book) async {
    final http.Response response = await http.post(
      baseUrl + 'old-books/add',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(book.toJson()),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return (response.statusCode);
    } else {
      throw Exception('http API Post Call Failed');
    }
  }

  Future<dynamic> closeListing(int id) async {
    final http.Response response = await http.get(
      baseUrl + 'old-books/add'+id.toString(),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      return (response.statusCode);
    } else {
      throw Exception('http API Post Call Failed');
    }
  }

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
    print("My response is "+response.body);
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
  static SnackBar customSnackBar({String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }
}
