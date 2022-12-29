import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizz/test/image_generation.dart/test_services.dart';
import 'package:rizz/shared/utils/test_button.dart';
import 'package:rizz/shared/utils/text_input.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  final TextEditingController _controller = TextEditingController();
  final TestServices _testServices = TestServices();
  String summaryResult = '';

  Future<String> summarizeText() async {
    setState(() {
      summaryResult = '';
    });
    summaryResult = await _testServices.summarizeText(
      context: context,
      text: _controller.text,
    );
    setState(() {});
    return summaryResult;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 60.h),
              TextInputBox(
                hintText: 'Type something',
                controller: _controller,
              ),
              SizedBox(height: 30.h),
              Button(
                onTap: summarizeText,
                text: 'Go',
              ),
              // SizedBox(height: 40.h),
              // Text(summaryResult),
              if (summaryResult != '')
              AnimatedTextKit(
                repeatForever: true,
                isRepeatingAnimation: false,
                animatedTexts: [
                  TypewriterAnimatedText(
                    summaryResult,
                    textStyle: TextStyle(
                      color: Colors.black,
                    ),
                    speed: const Duration(milliseconds: 100),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
