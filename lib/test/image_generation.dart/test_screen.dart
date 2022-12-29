import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizz/shared/utils/test_button.dart';
import 'package:rizz/test/image_generation.dart/test_services.dart';
import 'package:rizz/shared/utils/text_input.dart';


class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final TextEditingController _controller = TextEditingController();
  final TestServices _testServices = TestServices();
  String imageUrl = '';

  // void sendDescription() {
  //   _imageServices.generateImage(
  //     context: context,
  //     description: _controller.text,
  //   );
  // }

  Future<String> fetchImage() async {
    imageUrl = await _testServices.generateImage(
      context: context,
      description: _controller.text,
    );
    setState(() {});
    return imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width * 0.9;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageUrl == ''
                ? SizedBox(
                  height: w,
                  child: Text('Describe your image'),
                )
                : Container(
                    height: w,
                    width: w,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
            SizedBox(
              height: 40.h,
            ),
            TextInputBox(
              hintText: 'Describe your image',
              controller: _controller,
            ),
            SizedBox(
              height: 30.h,
            ),
            Button(
              // height: height,
              // width: width,
              onTap: fetchImage,
              text: 'Go',
            ),
          ],
        ),
      ),
    );
  }
}
