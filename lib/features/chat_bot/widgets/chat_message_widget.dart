import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rizz/features/chat_bot/models/chat_model.dart';
import 'package:rizz/shared/app_elements/app_colors.dart';
import 'package:rizz/shared/utils/alert.dart';

class ChatMessageWidget extends StatelessWidget {
  const ChatMessageWidget(
      {super.key, required this.text, required this.chatType});

  final String text;
  final ChatType chatType;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: chatType == ChatType.bot
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(
          top: 10.h,
          right: chatType == ChatType.bot ? 50.w : 0,
          left: chatType == ChatType.bot ? 0 : 50.w,
        ),
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
            // color: chatType == ChatType.bot
            //     ? AppColors.grey01
            //     : AppColors.darkPurple,
            gradient: RadialGradient(
              colors: chatType == ChatType.bot
                  ? [
                      AppColors.grey01,
                      AppColors.grey01,
                    ]
                  : [
                      AppColors.lightBlue,
                      AppColors.dBlue,
                    ],
              center: Alignment.topLeft,
              radius: 1,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r),
              topRight: Radius.circular(30.r),
              bottomLeft:
                  Radius.circular(chatType == ChatType.bot ? 5.r : 30.r),
              bottomRight:
                  Radius.circular(chatType == ChatType.bot ? 30.r : 5.r),
            )),
        child: chatType == ChatType.bot
            ? GestureDetector(
                onLongPress: () {
                  Clipboard.setData(ClipboardData(text: text.trim()));
                  showAlert(context, 'Copied');
                },
                child: Text(
                  text.trim(),
                  style:
                      GoogleFonts.spaceGrotesk(color: AppColors.neutralWhite),
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    text.trim(),
                    style:
                        GoogleFonts.spaceGrotesk(color: AppColors.neutralWhite),
                  ),
                ],
              ),
      ),
    );
  }
}
