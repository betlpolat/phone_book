///  Network request path
enum NetworkPath {
  USER(value: 'User'),
  UPLOAD_IMAGE(value: 'User/UploadImage');

  final String value;

  const NetworkPath({required this.value});

  String withQuery(String value) {
    return '/api/${this.value}/$value';
  }
}
