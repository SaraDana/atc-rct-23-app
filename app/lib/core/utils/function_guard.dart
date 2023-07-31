Future<bool> guard(Function future) async {
  try {
    await future();
    return true;
  } catch (e) {
    return false;
  }
}
