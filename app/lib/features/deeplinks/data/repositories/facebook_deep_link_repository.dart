import 'dart:async';

import 'package:app/features/deeplinks/domain/repositories/deep_link_repository.dart';
import 'package:flutter_facebook_app_links/flutter_facebook_app_links.dart';

class FacebookDeepLinkRepository implements DeepLinkRepository {
  final StreamController<Uri> _controller = StreamController<Uri>();

  @override
  Stream<Uri> getLinks() async* {
    String deepLink = await FlutterFacebookAppLinks.getDeepLink();
    _controller.add(Uri.parse(deepLink));

    yield* _controller.stream;
  }

  @override
  Future<Uri?> getInitialLink() async {
    dynamic deepLink = await FlutterFacebookAppLinks.initFBLinks();

    return Uri.parse(deepLink.toString());
  }
}
