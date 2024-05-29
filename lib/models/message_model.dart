import 'package:chat_app/constants.dart';

class MessageModel{
  final String message;

  factory MessageModel.fromJson(jsonData){
    return MessageModel(message: jsonData[kMessage],);
  }

  MessageModel({required this.message,});
}