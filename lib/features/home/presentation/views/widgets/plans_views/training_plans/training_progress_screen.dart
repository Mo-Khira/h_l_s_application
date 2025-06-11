import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/core/utils/app_router.dart';
import '../widgets/training_plans/next_training_button.dart';
import '../widgets/training_plans/timer_circle.dart';
import '../widgets/training_plans/toggle_button.dart';
import '../widgets/training_plans/training_image.dart';

class TrainingProgressScreen extends StatefulWidget {
  final int startIndex;

  const TrainingProgressScreen({super.key, required this.startIndex});

  @override
  TrainingProgressScreenState createState() => TrainingProgressScreenState();
}

class TrainingProgressScreenState extends State<TrainingProgressScreen> {
  late Timer _timer;
  int _totalSeconds = 300;
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
    if (_currentTrainingIndex < _trainingImages.length - 1) {
      setState(() {
        _currentTrainingIndex++;
        _elapsedSeconds = 0;
        _totalSeconds = 300;
        _startTimer();
      });
    } else {
      _timer.cancel();
      GoRouter.of(context).go(AppRouter.kTrainingCompletedScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      padding: const EdgeInsetsDirectional.all(0),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 28,
                      ),
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
              TrainingImage(imagePath: _trainingImages[_currentTrainingIndex]),
              const SizedBox(
                height: 20,
              ),
              TimerCircle(
                progressValue: _progressValue(),
                timeLeft: _formatTime(_totalSeconds - _elapsedSeconds),
                totalTime: _formatTime(_totalSeconds),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ToggleButton(isRunning: _isRunning, onTap: _toggleTimer),
                  const SizedBox(width: 20),
                  NextTrainingButton(onTap: _nextTraining),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
