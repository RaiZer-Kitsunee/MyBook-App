// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mybook_app/Data/DataBase.dart';
import 'package:mybook_app/Widgets/BookWidget.dart';
import 'package:mybook_app/Widgets/MemorieWidget.dart';
import 'package:mybook_app/Widgets/BookSheets/AddBookSheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //* controllers
  TextEditingController booktitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: books.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            //* title page
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 25, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //* title
                  Text(
                    "Your Journals",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),

                  Row(
                    children: [
                      //* add button
                      books.isEmpty
                          ? Container()
                          : GestureDetector(
                              onTap: () => AddBookSheet(context,
                                  booktitleController, () => setState(() {})),
                              child: Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade400,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 1,
                                      color: Colors.grey.shade700,
                                      spreadRadius: 1,
                                      offset: Offset(-2, 2),
                                    )
                                  ],
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                  ),
                                ),
                              ),
                            ),

                      //* the more button
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_vert_outlined,
                          size: 30,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),

            //* books part
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 20.0),
              child: SizedBox(
                height: 300,
                child: books.isEmpty
                    ? Row(
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
                      )
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: books.length,
                        itemBuilder: (context, index) => BookWidget(
                          mainColor: books[index].mainColor,
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
                margin: EdgeInsets.only(top: 30),
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                  color: Colors.grey.shade200,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: books.isEmpty
                      ? IfThereIsNoBooks(context)
                      : Column(
                          children: [
                            //* the tabs
                            TabBar(
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
                                                MemorieWidget(
                                              bookIndex: bookIndex,
                                              pageIndex: pageIndex,
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
