import 'dart:convert';
import 'package:chat_app/common/urls.dart';
import 'package:chat_app/features/chat_app/domain/entities/message.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../../../../error/failure.dart';
import '../../../domain/entities/person.dart';
import '../../models/person_model.dart';

abstract class HttpDataSource {
  Future<Either<Failure, List<Person>>> getPersons();
  Future<Either<Failure, List<MessageEntity>>> getMessages(String key);
  Future<Either<Failure, List<MessageEntity>>> postMessage(
      MessageEntity message, String key);
}

class HttpDataSourceImpl implements HttpDataSource {
  // method for fetching the users who are in the chat app
  @override
  Future<Either<Failure, List<Person>>> getPersons() async {
    List<Person> list;
    try {
      final response = await http.get(Uri.parse(Urls.usersUrl));
      list = List.from(json
          .decode(response.body)
          .map((element) => PersonModel.fromJson(element)));
      return Right(list);
    } on FetchFailure {
      return Left(FetchFailure(message: 'Failed to fetch...'));
    }
  }

  // method for posting the messages
  @override
  Future<Either<Failure, List<MessageEntity>>> postMessage(
      MessageEntity message, String key) async {
    try {
      final getResponse = await http.get(Uri.parse(Urls.messagesUrl));
      final map = jsonDecode(getResponse.body);
      if ((map as Map<String, dynamic>).isEmpty || map[key] == null) {
        map.addEntries([
          MapEntry(key, [message.toJson()])
        ]);
      } else {
        (map[key] as List).add(message.toJson());
      }

      await http.post(Uri.parse(Urls.messagesUrl),
          headers: {"Content-type": "application/json"}, body: jsonEncode(map));

      final updatedGetResponse = await http.get(Uri.parse(Urls.messagesUrl));
      final resultantList = List<MessageEntity>.from(
          jsonDecode(updatedGetResponse.body)[key]
              .map((json) => MessageEntity.fromJson(json)));

      return Right(resultantList);
    } on FetchFailure {
      return Left(FetchFailure(message: 'Failed to post.....'));
    }
  }

  // method for getting messages
  @override
  Future<Either<Failure, List<MessageEntity>>> getMessages(String key) async {
    try {
      List<MessageEntity> resultantList;
      final updatedGetResponse = await http.get(Uri.parse(Urls.messagesUrl));
      final map = jsonDecode(updatedGetResponse.body);

      if ((map as Map<String, dynamic>).isEmpty || map[key] == null) {
        resultantList = [];
      } else {
        resultantList = List<MessageEntity>.from(
            jsonDecode(updatedGetResponse.body)[key]
                .map((json) => MessageEntity.fromJson(json)));
      }

      return Right(resultantList);
    } on FetchFailure {
      return Left(FetchFailure(message: 'Failed to post.....'));
    }
  }
}
