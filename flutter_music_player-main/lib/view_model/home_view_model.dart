import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
    final txtSearch = TextEditingController().obs; 

    final hostRecommendedArr = [
        {
            "image": "assets/img/sontung1.png",
            "name": "Nơi Này Có Anh",
            "artists": "Son Tung-MTP"
        },
        {
            "image": "assets/img/img_2.png",
            "name": "Girl on Fire EDM",
            "artists": "Alecia Keys"
        }
    ].obs;

    final playListArr = [
        {
            "image": "assets/img/img_3.png",
            "name": "Top list",
            "artists": "Piano Guys"
        },
        {
            "image": "assets/img/img_4.png",
            "name": "Download music",
            "artists": "Dilon Bruce"
        },
        {
            "image": "assets/img/img_5.png",
            "name": "Ringtone music",
            "artists": "Michael Jackson"
        }
    ];

    final recentlyPlayedArr = [
        {
            "rate": 4,
            "name": "Billie Jean",
            "artists": "Michael Jackson"
        },
        {
            "rate": 4,
            "name": "Earth Song",
            "artists": "Michael Jackson"
        },
        {
            "rate": 4,
            "name": "Mirror",
            "artists": "Justin Timberlake"
        },
        {
            "rate": 4,
            "name": "Remember the Time",
            "artists": "Michael Jackson"
        }
    ].obs;
}

//.navigationViewStyle(StackNavigationViewStyle())
