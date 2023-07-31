abstract class Failure {}

class ServiceError extends Failure {
  String message;

  ServiceError({required this.message});
}
