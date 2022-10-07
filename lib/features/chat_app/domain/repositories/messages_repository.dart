import 'package:dartz/dartz.dart';

import '../../../../error/failure.dart';
import '../entities/message.dart';

abstract class MessagesRepository {
  Future<Either<Failure, List<MessageEntity>>> getMessages(String key);
  Future<Either<Failure, List<MessageEntity>>> postMessage({
    required MessageEntity message,
    required String key,
  });
}
