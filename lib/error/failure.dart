abstract class Failure {}

class FetchFailure extends Failure {
  final String message;
   FetchFailure({required this.message});
}

