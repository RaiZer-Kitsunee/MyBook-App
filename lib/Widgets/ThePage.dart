// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mybook_app/Data/DataBase.dart';
import 'package:mybook_app/Services/BooksServices.dart';
import 'package:mybook_app/Widgets/PagesSheet/updatePageScreen.dart';
import 'package:page_flip/page_flip.dart';

class Pages extends StatelessWidget {
  final int bookIndex;
  final int diractePage;
  final TextEditingController titleController;
  final TextEditingController contentController;
  final void Function() refrech;
  const Pages({
    super.key,
    required this.bookIndex,
    this.diractePage = 0,
    required this.titleController,
    required this.contentController,
    required this.refrech,
  });

  @override
  Widget build(BuildContext context) {
    GlobalKey flipController = GlobalKey<PageFlipWidgetState>();
    BooksServices booksServices = BooksServices();
    return Expanded(
      child: Stack(
        children: [
          //* the acualle page
          Container(
            margin: EdgeInsets.only(right: 20, top: 15, bottom: 15),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.horizontal(
                right: Radius.circular(50),
                left: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10, right: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(50),
                  ),
                  color: Colors.grey.shade400,
                ),
                child: PageFlipWidget(
                  initialIndex: diractePage,
                  key: flipController,
                  backgroundColor: Colors.white,
                  // isRightSwipe: true,
                  lastPage: Container(
                    color: Colors.white,
                    child: const Center(
                      child: Text('Last Page!'),
                    ),
                  ),
                  children: List.generate(
                    books[bookIndex].pages.length,
                    (pageIndex) => pageContent(
                      context: context,
                      pageIndex: pageIndex,
                      bookIndex: bookIndex,
                      booksServices: booksServices,
                      titleController: titleController,
                      contentController: contentController,
                    ),
                  ),
                ),
              ),
            ),
          ),
          //* the left line book page
          Container(
            color: Colors.grey,
            width: 15,
            margin: EdgeInsets.symmetric(vertical: 15),
          )
        ],
      ),
    );
  }

  GestureDetector pageContent({
    required BuildContext context,
    required int bookIndex,
    required int pageIndex,
    required BooksServices booksServices,
    required TextEditingController titleController,
    required TextEditingController contentController,
  }) {
    //* acutall variabels
    String title = books[bookIndex].pages[pageIndex].title;
    String content = books[bookIndex].pages[pageIndex].content;
    String dateNumbers = DateFormat('d,MMMM, hh:mm')
        .format(books[bookIndex].pages[pageIndex].dateTime)
        .toString();
    String dateName = DateFormat('EEEE')
        .format(books[bookIndex].pages[pageIndex].dateTime)
        .toString();

    return GestureDetector(
      onDoubleTap: () {
        titleController.text = title;
        contentController.text = content;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UpdatePageScreen(
              refrech: refrech,
              titleController: titleController,
              contentController: contentController,
              bookIndex: bookIndex,
              pageIndex: pageIndex,
            ),
          ),
        );
      },
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Column(
            children: [
              //* day num - month - time -------------- day
              Padding(
                padding: const EdgeInsets.only(right: 40, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(dateNumbers),
                    Text(dateName),
                  ],
                ),
              ),

              //* divider
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 0.9,
                margin: EdgeInsets.only(right: 35, top: 15),
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
              ),

              Container(
                margin: EdgeInsets.only(right: 20, top: 10),
                width: MediaQuery.sizeOf(context).width,
                height: 540,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //* page
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(content),
                  ],
                ),
              ),

              //* page number
              Text((pageIndex + 1).toString()),
            ],
          ),
        ),
      ),
    );
  }
}
