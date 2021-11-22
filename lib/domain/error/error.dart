abstract class Failure implements Exception {}

class InvalidError implements Failure {}

class DatasourceError implements Failure {
  final Error error;

  DatasourceError([this.error]);
}
