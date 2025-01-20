// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mybook_app/Data/DataBase.dart';
import 'package:mybook_app/Models/BooksModels.dart';
import 'package:mybook_app/Widgets/BookWidget.dart';
import 'package:mybook_app/Widgets/MemorieWidget.dart';
import 'package:mybook_app/Widgets/BookSheets/AddBookSheet.dart';
import 'package:mybook_app/Widgets/MyDismissible.dart';
import 'package:mybook_app/Widgets/MySnackBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //* controllers
  TextEditingController booktitleController = TextEditingController();

  //* refrences
  late SharedPreferences pref;

  //* functions
  readBooksFromSP() async {
    pref = await SharedPreferences.getInstance();

    String? loadedStringList = pref.getString(booksKey);

    if (loadedStringList != null) {
      List<dynamic> loadedJsonList = jsonDecode(loadedStringList);
      books = loadedJsonList.map((e) => BookModels.fromJson(e)).toList();
      setState(() {});
      print("Book List is Loaded");
    }

    print("the json String has come empty");
  }

  @override
  void initState() {
    readBooksFromSP();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: books.length,
      child: Scaffold(
        backgroundColor: Color(0xFFF3E1D3),
        body: Column(
          children: [
            //* title page
            Padding(
              padding: const EdgeInsets.only(top: 40, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //* the more button
                  IconButton(
                    onPressed: () => MySnackBar(
                        context: context, text: "Setting Next Update"),
                    icon: Icon(
                      Icons.menu_rounded,
                      size: 30,
                    ),
                  ),

                  //* title
                  Text(
                    "Journals",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xFF5E4D46),
                    ),
                  ),

                  //* add button
                  books.isEmpty
                      ? Container()
                      : GestureDetector(
                          onTap: () => AddBookSheet(context,
                              booktitleController, () => setState(() {})),
                          child: Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Color(0xFFE4CCB9),
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 1,
                                  color: Color(0xFFE4CCB4),
                                  spreadRadius: 1,
                                  offset: Offset(-2, 2),
                                )
                              ],
                            ),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: Color(0xFF5E4D46),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),

            //* search thing
            Container(
              padding: EdgeInsets.all(30),
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              decoration: BoxDecoration(
                color: Color(0xFFFDFAF5),
                borderRadius: BorderRadius.circular(12),
              ),
            ),

            //* notebooks thing
            Padding(
              padding: const EdgeInsets.only(
                  right: 20, left: 20, bottom: 25, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Notebooks",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Color(0xFF5E4D46),
                    ),
                  ),
                  Icon(Icons.more_vert),
                ],
              ),
            ),

            //* books part
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: SizedBox(
                height: 250,
                child: books.isEmpty
                    ? ifTheBooksIsEmpty()
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: books.length,
                        itemBuilder: (context, index) => BookWidget(
                          name: books[index].name,
                          index: index,
                          refrech: () => setState(() {}),
                        ),
                      ),
              ),
            ),

            //* the memories part
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 0),
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                  color: Color(0xFFFDFAF5),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: books.isEmpty
                      ? IfThereIsNoBooks(context)
                      : Column(
                          children: [
                            //* the tabs
                            TabBar(
                              indicatorColor: Color(0xFF5E4D46),
                              tabAlignment: TabAlignment.start,
                              isScrollable: true,
                              tabs: List.generate(
                                books.length,
                                (index) => Tab(
                                  child: Text(
                                    books[index].name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color(0xFF5E4D46),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            //* the tabs View
                            Expanded(
                              child: SizedBox(
                                width: MediaQuery.sizeOf(context).width,
                                child: TabBarView(
                                  children: List.generate(
                                    books.length,
                                    (bookIndex) => books[bookIndex]
                                            .pages
                                            .isEmpty
                                        ? IfThereIsNoBookPages()
                                        : ListView.builder(
                                            padding: EdgeInsets.zero,
                                            itemCount:
                                                books[bookIndex].pages.length,
                                            itemBuilder: (context, pageIndex) =>
                                                MyDismissible(
                                              context: context,
                                              bookIndex: bookIndex,
                                              pageIndex: pageIndex,
                                              refrech: () => setState(() {}),
                                              child: MemorieWidget(
                                                bookIndex: bookIndex,
                                                pageIndex: pageIndex,
                                              ),
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row ifTheBooksIsEmpty() {
    return Row(
      children: List.generate(
        3,
        (index) => Container(
          height: 400,
          width: 100,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Center IfThereIsNoBookPages() {
    return Center(
      child: Container(
        decoration: BoxDecoration(),
        child: Center(
          child: Text(
            "Let's Write Some Memories...",
            style: TextStyle(
              color: Colors.grey.shade600,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  Center IfThereIsNoBooks(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => AddBookSheet(
          context,
          booktitleController,
          () => setState(() {}),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade400,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 1,
                color: Colors.grey.shade700,
                spreadRadius: 1,
                offset: Offset(-5, 5),
              )
            ],
          ),
          padding: EdgeInsets.all(10),
          child: Text(
            "Create First Book",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
