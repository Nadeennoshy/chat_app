import 'package:chat_app/constants.dart';

class MessageModel {
  final String message;
  final String id;

  factory MessageModel.fromJson(jsonData) {
    return MessageModel(
      jsonData[kMessage],
      jsonData[kId],
    );
  }

  MessageModel(this.message, this.id);
}
