class Failure implements Exception {}

class ErrorAuth extends Failure {
  final String? message;

  ErrorAuth({this.message});
}

class DatasourceResultNull extends Failure {}