import 'dart:async';
import 'package:flutter/material.dart';
import '../widgets/training_plans/next_training_button.dart';
import '../widgets/training_plans/timer_circle.dart';
import '../widgets/training_plans/toggle_button.dart';
import '../widgets/training_plans/training_image.dart';

class TrainingProgressScreen extends StatefulWidget {
  final int startIndex;

  const TrainingProgressScreen({Key? key, required this.startIndex})
      : super(key: key);

  @override
  _TrainingProgressScreenState createState() => _TrainingProgressScreenState();
}

class _TrainingProgressScreenState extends State<TrainingProgressScreen> {
  late Timer _timer;
  int _totalSeconds = 1200;
  int _elapsedSeconds = 0;
  bool _isRunning = true;

  late int _currentTrainingIndex;

  final List<String> _trainingImages = [
    'assets/Images/Vector.png',
    'assets/Images/Group.png',
    'assets/Images/Group-1.png',
    'assets/Images/Group-2.png',
    'assets/Images/Vector 6.png',
    'assets/Images/Group-3.png',
  ];

  @override
  void initState() {
    super.initState();
    _currentTrainingIndex = widget.startIndex;
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  /// Starts or resumes the timer
  void _startTimer() {
    _isRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_elapsedSeconds >= _totalSeconds || !_isRunning) {
        _timer.cancel();
      } else {
        setState(() {
          _elapsedSeconds++;
        });
      }
    });
  }

  /// Toggles the timer between start and pause
  void _toggleTimer() {
    setState(() {
      _isRunning = !_isRunning;
    });

    if (_isRunning) {
      _startTimer();
    } else {
      _timer.cancel();
    }
  }

  /// Formats seconds to MM:SS
  String _formatTime(int totalSeconds) {
    final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    return '$minutes : $seconds';
  }

  /// Calculates the progress value between 0 and 1
  double _progressValue() {
    return _elapsedSeconds / _totalSeconds;
  }

  /// Moves to the next training exercise
  void _nextTraining() {
    setState(() {
      _currentTrainingIndex =
          (_currentTrainingIndex + 1) % _trainingImages.length;
      _elapsedSeconds = 0;
      _totalSeconds = 1200;
      _startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Training image
          TrainingImage(imagePath: _trainingImages[_currentTrainingIndex]),

          // Timer with progress
          TimerCircle(
            progressValue: _progressValue(),
            timeLeft: _formatTime(_totalSeconds - _elapsedSeconds),
            totalTime: _formatTime(_totalSeconds),
          ),

          // Control buttons
          Positioned(
            top: 700,
            left: 67,
            child: Row(
              children: [
                ToggleButton(isRunning: _isRunning, onTap: _toggleTimer),
                const SizedBox(width: 20),
                NextTrainingButton(onTap: _nextTraining),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
