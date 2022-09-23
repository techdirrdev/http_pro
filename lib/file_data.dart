class FileData {
  String fileName;
  String filePath;
  String fileMimeType;

  /// HTTP multipart request for file upload
  FileData(
      {required this.fileName,
      required this.filePath,
      required this.fileMimeType});
}
