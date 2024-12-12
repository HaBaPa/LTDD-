import 'package:get/get.dart';

class AlbumViewModel extends GetxController {
  final allList = [
    {
      "image": "assets/img/alb_1.png",
      "name": "Favourite",
      "artists": "< Unknown >",
      "songs": "15 Songs"
    },
    {
      "image": "assets/img/alb_2.png",
      "name": "Ringtone",
      "artists": "< Unknown >",
      "songs": "10 Songs"
    },
    {
      "image": "assets/img/alb_3.png",
      "name": "Lofi",
      "artists": "< Unknown >",
      "songs": "15 Songs"
    },
    {
      "image": "assets/img/alb_4.png",
      "name": "Game",
      "artists": "< Unknown >",
      "songs": "20 Songs"
    },
    {
      "image": "assets/img/alb_5.png",
      "name": "Soundtrack",
      "artists": "< Unknown >",
      "songs": "15 Songs"
    },
    {
      "image": "assets/img/alb_6.png",
      "name": "Dance",
      "artists": "< Unknown >",
      "songs": "10 Songs"
    }
  ].obs;

  final playedArr = [
    {"duration": "3:56", "name": "Billie Jean", "artists": "< Unknown >"},
    {"duration": "3:56", "name": "Earth Song", "artists": "< Unknown >"},
    {"duration": "3:56", "name": "Mirror", "artists": "Justin Timberlake"},
    {
      "duration": "3:56",
      "name": "Remember the Time",
      "artists": "Michael Jackson"
    },
    {"duration": "3:56", "name": "Billie Jean", "artists": "< Unknown >"},
    {"duration": "3:56", "name": "Earth Song", "artists": "< Unknown >"},
    {"duration": "3:56", "name": "Mirror", "artists": "Justin Timberlake"},
    {
      "duration": "3:56",
      "name": "Remember the Time",
      "artists": "Michael Jackson"
    },
    {"duration": "3:56", "name": "Billie Jean", "artists": "< Unknown >"},
    {"duration": "3:56", "name": "Earth Song", "artists": "< Unknown >"},
    {"duration": "3:56", "name": "Mirror", "artists": "Justin Timberlake"},
    {
      "duration": "3:56",
      "name": "Remember the Time",
      "artists": "< Unknown >"
    }
  ].obs;
}
