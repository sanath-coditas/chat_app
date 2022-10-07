import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable {
  final String message;
  final String createdTime;
  final int userId;
  final int recipientId;
  const MessageEntity({
    required this.message,
    required this.createdTime,
    required this.userId,
    required this.recipientId,
  });

  @override
  List<Object?> get props => [message, createdTime, userId, recipientId];
  factory MessageEntity.fromJson(Map<String, dynamic> json) {
    return MessageEntity(
        message: json['message'],
        createdTime: json['createdTime'],
        userId: json['userId'],
        recipientId: json['recipientId']);
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'message': message,
      'createdTime': createdTime,
      'userId': userId,
      'recipientId': recipientId,
    };
    return map;
  }
}
