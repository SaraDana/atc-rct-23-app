import 'dart:async';

import 'package:app/features/deeplinks/domain/repositories/deep_link_repository.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:uni_links/uni_links.dart';

class UniDeepLinkRepository implements DeepLinkRepository {
  final StreamController<Uri> _controller = StreamController<Uri>();

  var hasReadInitialUri = false;

  @override
  Stream<Uri> getLinks() {
    uriLinkStream.listen((Uri? uri) async {
      if (uri != null) {
        _controller.add(uri);
      }
    }, onError: (e) {
      _controller.addError(e);
    });
    return _controller.stream;
  }

  @override
  Future<Uri?> getInitialLink() async {
    if(hasReadInitialUri)
      return null;
    hasReadInitialUri = true;
    var initialUri = await getInitialUri();
    return initialUri;
  }

  void closeStream() {
    _controller.close();
  }
}
