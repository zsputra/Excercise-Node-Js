import 'package:demo_app/core/dependency_injection/getit_configuration.dart';
import 'package:demo_app/data/heroku_book/datasource/angram_remote_ds.dart';
import 'package:demo_app/domain/entities/AnagramEntity.dart';
import 'package:demo_app/domain/home/use_case/get_all_book_use_case.dart';
import 'package:demo_app/presentation/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IsogramContent extends StatefulWidget {
  @override
  _IsogramContentState createState() => _IsogramContentState();
}

class _IsogramContentState extends State<IsogramContent> {
  AnagramEntity anagram;
  String keyword;
  String word1;
  String word2;
  bool check;
  bool answer;

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

  _playAgain() {
    BlocProvider.of<HomeBloc>(context).add(GetListAnagramEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Form(
          child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Align(
                child: Text("Let's Play Isogram !!!"),
                alignment: Alignment.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                child: Center(
              child: Text("Is This Word Isogram? :"),
            )),
            getAnagram(),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  color: Colors.blue[100],
                  child: Text("Yes"),
                  onPressed: () {
                    BlocProvider.of<HomeBloc>(context)
                        .add(IsIsogramEvent(anagram.data[0]));
                    setState(() {
                      answer = true;
                    });
                  },
                ),
                RaisedButton(
                  color: Colors.orange[100],
                  child: Text("No"),
                  onPressed: () {
                    BlocProvider.of<HomeBloc>(context)
                        .add(IsIsogramEvent(anagram.data[0]));
                    setState(() {
                      answer = false;
                    });
                  },
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            BlocBuilder<HomeBloc, HomeState>(
              condition: (prevState, currState) {
                return currState is IsIsogramState;
              },
              builder: (context, state) {
                if (state is IsIsogramState) {
                  check = state.isIsogram;
                  if (check == answer) {
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
      )),
    ));
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
