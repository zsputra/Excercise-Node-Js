import 'package:demo_app/core/dependency_injection/getit_configuration.dart';
import 'package:demo_app/data/heroku_book/datasource/angram_remote_ds.dart';
import 'package:demo_app/domain/entities/AnagramEntity.dart';
import 'package:demo_app/domain/home/use_case/get_all_book_use_case.dart';
import 'package:demo_app/presentation/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnagramContent extends StatefulWidget {
  @override
  _AnagramContentState createState() => _AnagramContentState();
}

class _AnagramContentState extends State<AnagramContent> {
  AnagramEntity anagram;
  String keyword;
  String word1;
  String word2;
  bool check;

  final _formKey = GlobalKey<FormState>();

  GetListAnagramUseCase getListAnagramUseCase = getIt<GetListAnagramUseCase>();
  AnagramDs anagramDs = getIt<AnagramDs>();

  TextEditingController _controller = TextEditingController();

  // GetAllBookUseCase getAllBookUseCase = getIt<GetAllBookUseCase>();

  @override
  void initState() {
    super.initState();
    word1 = "coba";
    word2 = "lagi";
    // _getData();
    BlocProvider.of<HomeBloc>(context).add(GetListAnagramEvent());
  }

  Future<void> _getData() async {
    bool isAnagram = await anagramDs.isAnagram(word1, word2);
    setState(() {
      check = isAnagram;
    });
  }

  Widget _buildProgressBar() {
    return Center(child: CircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Form(
            child: Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Container(
            child: Align(
              child: Text("Welcome to Anagram Play"),
              alignment: Alignment.center,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Row(
              children: <Widget>[Text("Find the Anagram of: ")],
            ),
          ),
          getAnagram(),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                labelText: "Your Keyword"),
            style: Theme.of(context).textTheme.body1,
            controller: _controller,
            onChanged: (v) {
              setState(() {
                keyword = v;
              });
            },
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            child: Text("Save"),
            onPressed: () {
              BlocProvider.of<HomeBloc>(context)
                  .add(IsAnagramEvent(anagram.data[0], keyword));
            },
          ),
          BlocBuilder<HomeBloc, HomeState>(
            condition: (prevState, currState){
              return currState is IsAnagramState;
            },
            builder: (context, state) {
              if (state is IsAnagramState) {
                check = state.isAnagram;
                if (check) {
                  return Text("Correct!, Congratulation!!");
                } else {
                  return Text("Incorrect!!, PLEASE TRY AGAIN!!");
                }
              } else {
                return SizedBox.shrink();
              }
            },
          )
        ],
      ),
    )));
  }

  Widget getAnagram() {
    return BlocBuilder<HomeBloc, HomeState>(
      condition: (state1, state2) {
        return state2 is GetAnagramListState;
      },
      builder: (context, state) {
        if (state is GetAnagramListState) {
          anagram = state.anagrams;
          return Container(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                anagram.data[0],
                style: TextStyle(fontSize: 24),
              ),
            ),
          );
        } else {
          return _buildProgressBar();
        }
      },
    );
  }
}
