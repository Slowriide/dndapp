import 'dart:ui';

import 'package:dnd_app/common/widgets/general/my_button_large.dart';
import 'package:dnd_app/domain/entities/dnd/book.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class BookScreen extends StatelessWidget {
  final Book book;

  const BookScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _BookDetails(book: book),
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }
}

class _BookDetails extends StatelessWidget {
  final Book book;
  const _BookDetails({required this.book});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            //INFO PRINCIPAL
            Stack(
              //FONDO
              children: [
                Image.asset(book.imagePath),
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Back
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => context.pop(context),
                          icon: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.bookmark_border_sharp,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 0, bottom: 15),
                            //imagen
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.asset(
                                book.imagePath,
                                height: 300,
                                width: 220,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          //titulo
                          Text(
                            book.name,
                            style: textStyles.titleMedium,
                          ),
                          //subitulo
                          Text(
                            'Publisher:${book.subtitle}',
                            style: GoogleFonts.roboto(
                              color: Colors.grey[500],
                            ),
                          ),

                          //Buy button
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 15,
                            ),
                            child: MyButtonLarge(
                              color: const Color.fromARGB(255, 12, 175, 250),
                              text:
                                  book.isFree ? 'Free' : book.price.toString(),
                              height: 60,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            child: Column(
                              children: [
                                Text(
                                  'Non ut exercitation aliqua laboris ea do sit consequat tempor nulla irure est elit sit. Non cillum minim magna laborum incididunt. Laborum deserunt esse exercitation enim ipsum officia est cupidatat. Do proident in officia duis veniam elit. Lorem elit dolore irure do nostrud sint exercitation sint id et aute excepteur non. Et voluptate ex ea tempor reprehenderit fugiat cupidatat deserunt qui nulla tempor ad.',
                                ),
                                Text(
                                  'Non ut exercitation aliqua laboris ea do sit consequat tempor nulla irure est elit sit. Non cillum minim magna laborum incididunt. Laborum deserunt esse exercitation enim ipsum officia est cupidatat. Do proident in officia duis veniam elit. Lorem elit dolore irure do nostrud sint exercitation sint id et aute excepteur non. Et voluptate ex ea tempor reprehenderit fugiat cupidatat deserunt qui nulla tempor ad.',
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),

            //IMAGEN
          ],
        ),
      ),
    );
  }
}
