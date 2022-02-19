import 'package:quizz_app/model/question_model.dart';

List<QuestionModel> questions = [
  QuestionModel("How Many Houses does Hogwarts have?", "images/hogwarts.jpg",
      {
        "1": false,
        "2": false,
        "3": false,
        "4": true
      },
  ),
  QuestionModel("What house is Luna Lovegood from", "images/luna.jpg",
    {
      "Gryffindor": false,
      "Hufflepuff": false,
      "Ravenclaw": true,
      "Slytherin": false
    },
  ),
  QuestionModel("How many siblings does Ron Weasley have?", "images/ron.jpg",
    {
      "6": true,
      "4": false,
      "3": false,
      "5": false
    },
  ),
  QuestionModel("what are the names of the Dursleys (dad, mom, son respectively)?", "images/dursleys.jpg",
    {
      "Wembley, Petra, Damion": false,
      "Walter, Rose, Dobby": false,
      "Vernon, Petunia, Dudley": true,
      "Voldemort, Lily, Dean": false
    },
  ),
  QuestionModel("how many books does the saga have?", "images/books.jpg",
    {
      "9": false,
      "7": true,
      "8": false,
      "6": false
    },
  ),
  QuestionModel("what is the Dumbledore's second name?", "images/dumbledore.jpg",
    {
      "Albus": false,
      "Dumbledore": false,
      "Percival": true,
      "Wulfric": false
    },
  ),
  QuestionModel("how many Horcruxes were there?", "images/horcruxes.jpg",
    {
      "10": false,
      "5": false,
      "7": false,
      "8": true
    },
  ),
  QuestionModel("Where was Harry Born?", "images/harry_born.jpg",
    {
      "Hogwarts": false,
      "King's Cross": false,
      "Godric's Hollow": true,
      "Hogsmeade": false
    },
  ),
  QuestionModel("what were Harry's parent's names?", "images/Lily_James.jpg",
    {
      "Lily & James": true,
      "Sirius & Molly": false,
      "Arthur & Tonks": false,
      "Lupin & Ginny": false
    },
  ),
  QuestionModel("How many HP movies are there?", "images/movies.jpg",
    {
      "6": false,
      "8": true,
      "9": false,
      "7": false
    },
  ),
];