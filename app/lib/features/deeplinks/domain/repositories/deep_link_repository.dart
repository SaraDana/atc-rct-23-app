import 'dart:async';

abstract class DeepLinkRepository {
  Stream<Uri> getLinks();
  Future<Uri?> getInitialLink();
}
