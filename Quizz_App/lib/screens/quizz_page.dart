import 'package:flutter/material.dart';
import 'package:quizz_app/screens/result_screen.dart';
import 'package:quizz_app/data/questions_list.dart';

class QuizzPage extends StatefulWidget {
  const QuizzPage({Key? key}) : super(key: key);

  @override
  _QuizzPageState createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {

  Color mainColor = Color(0xFF252c4a);
  Color secondColor = Color(0xFF117eeb);
  PageController? _controller = PageController(initialPage: 0);
  bool isPressed = false;
  Color isTrue = Colors.green;
  Color isWrong = Colors.red;
  Color btnColor = Color(0xFF117eeb);
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: mainColor,
        body: Padding(
          padding: EdgeInsets.all(18.0),
          child: PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            controller: _controller!,
            onPageChanged: (page) {
              setState(() {
                isPressed = false;
              });
            },
            itemCount: questions.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Question ${index + 1} /${questions.length}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 28.0),
                    ),
                  ),
                  const Divider(
                    color: Colors.lightBlue,
                    height: 8.0,
                    thickness: 1.0,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    questions[index].question!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Image.asset(
                      questions[index].image!,
                      fit: BoxFit.fitWidth,
                      height: 140.0,
                      width: 1000.0,
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  for (int i = 0; i < questions[index].answer!.length; i++)
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 24.0),
                      child: MaterialButton(
                        shape: StadiumBorder(),
                        color: isPressed
                            ? questions[index].answer!.entries.toList()[i].value
                            ? isTrue
                            : isWrong
                            : secondColor,
                        padding: EdgeInsets.symmetric(vertical: 18.0),
                        onPressed: isPressed
                            ? () {}
                            : () {
                          setState(() {
                            isPressed = true;
                          });
                          if (questions[index]
                              .answer!
                              .entries
                              .toList()[i]
                              .value) {
                            score++;
                          }
                        },
                        child: Text(
                          questions[index].answer!.keys.toList()[i],
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      isPressed ? OutlinedButton(
                        onPressed: isPressed
                            ? index + 1 == questions.length
                            ? () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ResultScreen(score)));
                        }
                            : () {
                          _controller!.nextPage(
                              duration: Duration(milliseconds: 1000),
                              curve: Curves.easeOutCirc);
                          setState(() {
                            isPressed = false;
                          });
                        }
                            : null,
                        style: OutlinedButton.styleFrom(
                            shape: StadiumBorder(),
                            side: BorderSide(color: Colors.amber, width: 1.0)
                        ),
                        child: Text(
                          index + 1 == questions.length
                              ? "See results"
                              : "Next Question",
                          style: TextStyle(color: Colors.white),
                        ),
                      ) : SizedBox(height: 48.0,)
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
