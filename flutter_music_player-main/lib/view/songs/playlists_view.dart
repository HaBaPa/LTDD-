import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';
import 'package:file_picker/file_picker.dart'; // Thêm thư viện File Picker

// Màn hình hiển thị lời bài hát
class LyricsView extends StatelessWidget {
  const LyricsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        title: const Text("Lyrics", style: TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: const [
                Text(
                  "Nơi Này Có Anh - Sơn Tùng M-TP",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  '''Em là ai từ đâu bước đến nơi đây dịu dàng chân phương

Em là ai tựa như ánh nắng ban mai ngọt ngào trong sương

Ngắm em thật lâu con tim anh yếu mềm

Đắm say từ phút đó từng giây trôi yêu thêm.

Bao ngày qua bình minh đánh thức xua tan bộn bề nơi anh

Bao ngày qua niềm thương nỗi nhớ bay theo bầu trời trong xanh

Liếc đôi hàng mi mong manh anh thẫn thờ

Muốn hôn nhẹ mái tóc bờ môi em, anh mơ.


[Điệp khúc:]

Cầm tay anh, dựa vai anh

Kề bên anh nơi này có anh

Gió mang câu tình ca

Ngàn ánh sao vụt qua nhẹ ôm lấy em

(Yêu em thương em con tim anh chân thành).

Cầm tay anh, dựa vai anh

Kề bên anh nơi này có anh

Khép đôi mi thật lâu

Nguyện mãi bên cạnh nhau

Yêu say đắm như ngày đầu.

Mùa xuân đến bình yên cho anh những giấc mơ

Hạ lưu giữ ngày mưa ngọt ngào nên thơ

Mùa thu lá vàng rơi đông sang anh nhớ em

Tình yêu bé nhỏ xin dành tặng riêng em.

[Rap:]

Còn đó tiếng nói ấy bên tai vấn vương bao ngày qua

Ánh mắt bối rối nhớ thương bao ngày qua

Yêu em anh thẫn thờ, con tim bâng khuâng đâu có ngờ

Chẳng bao giờ phải mong chờ

Đợi ai trong chiều hoàng hôn mờ

Đắm chìm hòa vào vần thơ

Ngắm nhìn khờ dại mộng mơ

Đừng bước vội vàng rồi làm ngơ

Lạnh lùng đó làm bộ dạng thờ ơ

Nhìn anh đi em nha

Hướng nụ cười cho riêng anh nha

Đơn giản là yêu con tim anh lên tiếng thôi.

[Điệp khúc:]

Cầm tay anh, dựa vai anh

Kề bên anh nơi này có anh

Gió mang câu tình ca

Ngàn ánh sao vụt qua nhẹ ôm lấy em

(Yêu em thương em con tim anh chân thành).

Cầm tay anh, dựa vai anh

Kề bên anh nơi này có anh

Khép đôi mi thật lâu

Nguyện mãi bên cạnh nhau

Yêu say đắm như ngày đầu.

Mùa xuân đến bình yên cho anh những giấc mơ

Hạ lưu giữ ngày mưa ngọt ngào nên thơ

Mùa thu lá vàng rơi đông sang anh nhớ em

Tình yêu bé nhỏ xin dành tặng riêng em.''',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    height: 1.6, // Tăng khoảng cách dòng để dễ đọc
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PlaylistsView extends StatefulWidget {
  const PlaylistsView({super.key});

  @override
  State<PlaylistsView> createState() => _PlaylistsViewState();
}

class _PlaylistsViewState extends State<PlaylistsView> {
  late AudioPlayer _audioPlayer;
  Duration _currentPosition = Duration.zero;
  Duration _totalDuration = Duration.zero;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    _audioPlayer = AudioPlayer();
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.music());

    // Phát nhạc từ file nội bộ
    await _audioPlayer.setAsset('assets/audio/noi_nay_co_anh.mp3');

    _audioPlayer.positionStream.listen((position) {
      setState(() {
        _currentPosition = position;
      });
    });

    _audioPlayer.durationStream.listen((duration) {
      setState(() {
        if (duration != null) {
          _totalDuration = duration;
        }
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Column(
          children: [
            // AppBar section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.arrow_back, color: Colors.white),
                  Row(
                    children: [
                      Column(
                        children: const [
                          Icon(Icons.music_note, color: Colors.orange, size: 28),
                          SizedBox(height: 4),
                          Text(
                            "Music",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      GestureDetector(
                        onTap: () {
                          // Điều hướng tới màn hình Lyrics khi click vào icon Lyrics
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LyricsView()),
                          );
                        },
                        child: Column(
                          children: const [
                            Icon(Icons.lyrics, color: Colors.orange, size: 28),
                            SizedBox(height: 4),
                            Text(
                              "Lyrics",
                              style: TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Icon(Icons.more_vert, color: Colors.white),
                ],
              ),
            ),

            // Album artwork and song details
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 30,
                          offset: const Offset(0, 15),
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage("assets/img/sontung1.png"),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Nơi Này Có Anh",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Son Tung-MTP",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Progress bar and controls
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _formatDuration(_currentPosition),
                        style: const TextStyle(color: Colors.grey),
                      ),
                      Expanded(
                        child: Slider(
                          value: _currentPosition.inSeconds.toDouble(),
                          max: _totalDuration.inSeconds.toDouble(),
                          onChanged: (value) async {
                            await _audioPlayer.seek(Duration(seconds: value.toInt()));
                          },
                          activeColor: Colors.orange,
                          inactiveColor: Colors.grey,
                        ),
                      ),
                      Text(
                        _formatDuration(_totalDuration),
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.skip_previous, size: 24, color: Colors.white),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 24),
                      // Play button with yellow border
                      Container(
                        padding: const EdgeInsets.all(1), // Adjust padding to make circle smaller
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.orange, width: 1), // Yellow border with thinner width
                        ),
                        child: IconButton(
                          icon: Icon(
                            _audioPlayer.playing ? Icons.pause : Icons.play_arrow,
                            size: 24, // Adjust size of Play/Pause button
                            color: Colors.white,
                          ),
                          onPressed: () {
                            if (_audioPlayer.playing) {
                              _audioPlayer.pause();
                            } else {
                              _audioPlayer.play();
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 24),
                      IconButton(
                        icon: const Icon(Icons.skip_next, size: 24, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
