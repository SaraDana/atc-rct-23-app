import 'dart:async';

import 'package:app/features/deeplinks/domain/repositories/deep_link_repository.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:uni_links/uni_links.dart';

class FirebaseDeepLinkRepository implements DeepLinkRepository {
  final FirebaseDynamicLinks links = FirebaseDynamicLinks.instance;
  final StreamController<Uri> _controller = StreamController<Uri>();

  @override
  Stream<Uri> getLinks() {
    links.onLink.listen((PendingDynamicLinkData? data) async {
      final Uri? deepLink = data?.link;
      if (deepLink != null) {
        _controller.add(deepLink);
      }
    }, onError: (e) {
      _controller.addError(e);
    });

    linkStream.listen((String? link) {
      if (link != null) {
        _controller.add(Uri.parse(link));
      }
    }, onError: (e) {
      _controller.addError(e);
    });
    return _controller.stream;
  }

  @override
  Future<Uri?> getInitialLink() async {
    final PendingDynamicLinkData? data = await links.getInitialLink();
    return data?.link;
  }

  void closeStream() {
    _controller.close();
  }
}
