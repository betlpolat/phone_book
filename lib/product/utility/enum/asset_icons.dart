///  Asset icons
enum AssetIcons {
  add_button,
  camera,
  check,
  gallery,
  profile,
  search;

  /// function for asset icon paths
  String path() {
    return 'asset/icon/$name.png';
  }
}
