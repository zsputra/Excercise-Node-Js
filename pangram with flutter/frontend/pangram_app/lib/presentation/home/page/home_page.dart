import 'package:demo_app/domain/entities/book_entity.dart';
import 'package:demo_app/presentation/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BookEntity> books;

  // GetAllBookUseCase getAllBookUseCase = getIt<GetAllBookUseCase>();

  @override
  void initState() {
    super.initState();
    // _getData();s
    BlocProvider.of<HomeBloc>(context).add(GetAllBookEvent());
  }

  // Future<void> _getData() async {
  //   List<BookEntity> results = await getAllBookUseCase(NoPayload());
  //   setState(() {
  //     books = results;
  //   });
  // }

  Widget _buildProgressBar() {
    return Center(child: CircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetAllBookState) {
          books = state.books;
          return pangramOfTheDayBook(books[0]);
        } else {
          return _buildProgressBar();
          // return const SizedBox.shrink();
        }
      },
    );
  }

  Widget pangramOfTheDayBook(BookEntity book) {
    return Container(
        padding: const EdgeInsets.all(8),
        child: Card(
          elevation: 5,
          child: new InkWell(
            onTap: () {
              BlocProvider.of<HomeBloc>(context).add(GetAllBookEvent());
            },
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    book.image,
                    fit: BoxFit.fill,
                    height: 310,
                    width: 365,
                  ),
                ),
                ListTile(
                  title: Text(
                    book.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // subtitle: Text(book.title),
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(left: 12, right: 12),
                  child: Text(
                    book.pangrams,
                    maxLines: 8,
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
              ],
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ));
    // return Container(
    //     child: Card(
    //         elevation: 4,
    //         child: Container(
    //           height: 100,
    //           child: Column(
    //             children: <Widget>[
    //               Flexible(
    //                   flex: 2,
    //                   child: Image.network(
    //                     book.image,
    //                     fit: BoxFit.fill,
    //                   )),
    //               SizedBox(
    //                 height: 20,
    //               ),
    //               Flexible(
    //                 child: Text(book.title),
    //               ),
    //               SizedBox(
    //                 height: 20,
    //               ),
    //               Flexible(
    //                   child: Text(
    //                 book.pangrams,
    //                 overflow: TextOverflow.ellipsis,
    //                 maxLines: 4,
    //               ))
    //             ],
    //           ),
    //         )));
  }
}
