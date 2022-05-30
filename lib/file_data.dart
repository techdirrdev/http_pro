class FileData {
  String fileName;
  String filePath;
  String fileMimeType;

  /// HTTP multipart request for file upload
  FileData({this.fileName = "", this.filePath = "", this.fileMimeType = ""});
}
