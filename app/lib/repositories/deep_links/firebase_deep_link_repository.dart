import 'dart:async';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class FirebaseDeepLinkRepository {
  static final FirebaseDeepLinkRepository _instance =
      FirebaseDeepLinkRepository._internal();

  factory FirebaseDeepLinkRepository() {
    return _instance;
  }

  final FirebaseDynamicLinks _links = FirebaseDynamicLinks.instance;
  final StreamController<Uri> _controller = StreamController<Uri>();
  FirebaseDeepLinkRepository._internal();

  //helper method to close our controller sink
  closeLinksStream() {
    _controller.close();
  }

  //setup onLink listener and put results on a stream
  Stream<Uri> getLinks() {
    _links.onLink.listen((PendingDynamicLinkData? data) async {
      final Uri? deepLink = data?.link;
      if (deepLink != null) {
        _controller.add(deepLink);
      }
    }, onError: (e) {
      _controller.addError(e);
    });
    return _controller.stream;
  }

  //get initial launch deeplink link if application was closed and onLink not yet setup
  Future<Uri?> getInitialLink() async {
    final PendingDynamicLinkData? data = await _links.getInitialLink();
    return data?.link;
  }
}
