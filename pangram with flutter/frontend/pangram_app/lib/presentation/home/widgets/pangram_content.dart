import 'package:demo_app/domain/entities/book_entity.dart';
import 'package:demo_app/presentation/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PangramContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}

class _PangramContentState extends State<PangramContent> {
  List<BookEntity> books;

  @override
  void initState() {
    super.initState();
    // _getData();s
    BlocProvider.of<HomeBloc>(context).add(GetAllBookEvent());
  }

  Widget _buildProgressBar() {
    return Center(child: CircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
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
    return Card(
      child: Text("coba"),
    );

    // Container(
    //     margin: EdgeInsets.all(20),
    //     child: Card(
    //         elevation: 4,
    //         margin: EdgeInsets.all(10),
    //         child: Container(
    //           child: Column(
    //             children: <Widget>[
    //               Flexible(child: Image.network(book.image)),
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
    //               ))
    //             ],
    //           ),
    //         )));
  }
}
