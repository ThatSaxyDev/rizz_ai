import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chatgpt_api/flutter_chatgpt_api.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizz/features/chat_bot/models/chat_model.dart';
import 'package:rizz/features/chat_bot/widgets/chat_message_widget.dart';
import 'package:rizz/shared/app_elements/app_colors.dart';
import 'package:rizz/shared/app_elements/app_texts.dart';
import 'package:rizz/shared/utils/spacer.dart';
import 'package:rizz/test/image_generation.dart/test_services.dart';
import 'package:rizz/shared/utils/alert.dart';

const backgroundColor = Color(0xff343541);
const botBackgroundColor = Color(0xff444654);

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _textController = TextEditingController();
  final _scrollController = ScrollController();
  final List<ChatText> _messages = [
    ChatText(text: 'Hi, I\'m your favourite chat bot', chatType: ChatType.bot),
    ChatText(
        text:
            'Hi, I\'m your favourite chat bot Hi, I\'m your favourite chat bot Hi, I\'m your favourite chat bot Hi, I\'m your favourite chat bot',
        chatType: ChatType.user),
    ChatText(text: 'Hi, I\'m your favourite chat bot', chatType: ChatType.bot),
    ChatText(text: AppTexts.onboardingDummy, chatType: ChatType.user),
    ChatText(text: AppTexts.onboardingDummy, chatType: ChatType.bot),
    ChatText(
        text:
            'Hi, I\'m your favourite chat bot Hi, I\'m your favourite chat bot Hi, I\'m your favourite chat bot Hi, I\'m your favourite chat bot',
        chatType: ChatType.user),
    ChatText(text: 'Hi, I\'m your favourite chat bot', chatType: ChatType.bot),
    ChatText(
        text:
            'Hi, I\'m your favourite chat bot Hi, I\'m your favourite chat bot Hi, I\'m your favourite chat bot Hi, I\'m your favourite chat bot',
        chatType: ChatType.user),
    ChatText(text: 'Hi, I\'m your favourite chat bot', chatType: ChatType.bot),
    ChatText(text: AppTexts.onboardingDummy, chatType: ChatType.user),
    ChatText(text: AppTexts.onboardingDummy, chatType: ChatType.bot),
    ChatText(
        text:
            'Hi, I\'m your favourite chat bot Hi, I\'m your favourite chat bot Hi, I\'m your favourite chat bot Hi, I\'m your favourite chat bot',
        chatType: ChatType.user),
  ];
  final TestServices _testServices = TestServices();
  late bool isLoading;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 13.w),
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              SizedBox(
                child: _buildList(),
              ),
              Visibility(
                visible: isLoading,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black54,
                      ],
                    ),
                  ),
                  height: 90.h,
                  child: const Spc(),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 30.h,
                child: SizedBox(
                  height: 60.h,
                  child: Row(
                    children: [
                      _buildInput(),
                      Spc(w: 10.w),
                      _buildSubmit(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubmit() {
    return Visibility(
      visible: !isLoading || _textController.text.isNotEmpty,
      child: Container(
        height: double.infinity,
        width: 60.w,
        color: AppColors.grey3,
        child: IconButton(
          icon: const Icon(
            Icons.send_rounded,
            color: AppColors.grey4,
          ),
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              setState(
                () {
                  _messages.add(
                    ChatText(
                      text: _textController.text,
                      chatType: ChatType.user,
                    ),
                  );
                  isLoading = true;
                },
              );
              var input = _textController.text;
              _textController.clear();
              Future.delayed(const Duration(milliseconds: 50))
                  .then((_) => _scrollDown());
              var newMessage = await _testServices.summarizeText(
                context: context,
                text: input,
              );
              setState(() {
                isLoading = false;
                _messages.add(
                  ChatText(
                    text: newMessage,
                    chatType: ChatType.bot,
                  ),
                );
              });
              _textController.clear();
              Future.delayed(const Duration(milliseconds: 50))
                  .then((_) => _scrollDown());
            }
          },
        ),
      ),
    );
  }

  Widget _buildInput() {
    return Expanded(
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(color: Colors.white),
        controller: _textController,
        cursorColor: AppColors.neutralWhite,
        decoration: InputDecoration(
          helperText: '',
          helperStyle: const TextStyle(fontSize: 0.0005),
          errorStyle: const TextStyle(fontSize: 0.0005),
          isDense: true,
          fillColor: AppColors.black,
          filled: true,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.grey),
            borderRadius: BorderRadius.circular(15.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.grey),
            borderRadius: BorderRadius.circular(15.r),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.grey),
            borderRadius: BorderRadius.circular(15.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.grey),
            borderRadius: BorderRadius.circular(15.r),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.grey),
            borderRadius: BorderRadius.circular(15.r),
          ),
          disabledBorder: InputBorder.none,
        ),
        validator: (val) {
          if (val == null || val.isEmpty) {
            return '';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        var message = _messages[index];
        return ChatMessageWidget(
          text: message.text,
          chatType: message.chatType,
        );
      },
    );
  }

  void _scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
