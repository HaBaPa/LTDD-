import 'package:flutter/material.dart';

class EqualizerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Equalizer'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: Text('Turn On Equalizer'),
            value: true,
            onChanged: (value) {
              // Handle switch logic here
            },
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Custom', style: TextStyle(fontSize: 18)),
                SliderTheme(
                  data: SliderThemeData(
                    trackHeight: 2,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8),
                  ),
                  child: Column(
                    children: [
                      _buildEqualizerSlider('60Hz'),
                      _buildEqualizerSlider('230Hz'),
                      _buildEqualizerSlider('910Hz'),
                      _buildEqualizerSlider('3.6kHz'),
                      _buildEqualizerSlider('14kHz'),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildKnob('Bass'),
                    _buildKnob('Virtualizer'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEqualizerSlider(String frequency) {
    return Row(
      children: [
        Expanded(
          child: Slider(
            value: 0,
            min: -15,
            max: 15,
            divisions: 30,
            label: '0 dB',
            onChanged: (value) {
              // Handle slider logic here
            },
          ),
        ),
        Text(frequency),
      ],
    );
  }

  Widget _buildKnob(String label) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.deepPurple,
          ),
          child: Center(
            child: Text(
              'MIN\nMAX',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 16)),
      ],
    );
  }
}
class equalizerView extends StatefulWidget {
  const equalizerView({Key? key}) : super(key: key);

  @override
  State<equalizerView> createState() => _EqualizerViewState();
}

class _EqualizerViewState extends State<equalizerView> {
  bool isEqualizerOn = false; // Trạng thái bật/tắt Equalizer
  Map<String, double> frequencies = {
    '60Hz': 0,
    '230Hz': 0,
    '910Hz': 0,
    '3.6kHz': 0,
    '14kHz': 0,
  }; // Lưu giá trị từng tần số
  double bassLevel = 0; // Mức Bass
  double virtualizerLevel = 0; // Mức Virtualizer

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Equalizer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Switch bật/tắt Equalizer
            SwitchListTile(
              title: const Text('Turn On Equalizer'),
              value: isEqualizerOn,
              onChanged: (value) {
                setState(() {
                  isEqualizerOn = value;
                });
              },
            ),
            const SizedBox(height: 20),
            // Sliders cho tần số
            Expanded(
              child: ListView(
                children: frequencies.keys.map((key) {
                  return _buildEqualizerSlider(key);
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            // Knob điều chỉnh Bass và Virtualizer
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildKnob('Bass', bassLevel, (value) {
                  setState(() {
                    bassLevel = value;
                  });
                }),
                _buildKnob('Virtualizer', virtualizerLevel, (value) {
                  setState(() {
                    virtualizerLevel = value;
                  });
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Hàm xây dựng Slider cho từng tần số
  Widget _buildEqualizerSlider(String frequency) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          frequency,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Slider(
          value: frequencies[frequency]!,
          min: -15,
          max: 15,
          divisions: 30,
          label: frequencies[frequency]!.toStringAsFixed(1) + ' dB',
          onChanged: isEqualizerOn
              ? (value) {
            setState(() {
              frequencies[frequency] = value;
            });
          }
              : null,
        ),
      ],
    );
  }

  // Hàm xây dựng Knob cho Bass hoặc Virtualizer
  Widget _buildKnob(String label, double value, Function(double) onChanged) {
    return Column(
      children: [
        GestureDetector(
          onPanUpdate: (details) {
            setState(() {
              double newValue = value + details.delta.dy * -0.1;
              newValue = newValue.clamp(0, 15); // Giới hạn giá trị từ 0 đến 15
              onChanged(newValue);
            });
          },
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.deepPurple,
            ),
            child: Center(
              child: Text(
                '${value.toStringAsFixed(1)} dB',
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}