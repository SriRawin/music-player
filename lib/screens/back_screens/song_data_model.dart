class SongDataModel {
  List<Mp3Model> mp3Files;

  SongDataModel(this.mp3Files);
  SongDataModel.fromJson(Map<String, dynamic> json) {
    if (json['Mp3Files'] != null) {
      mp3Files = List<Mp3Model>();
      json['Mp3Files'].forEach((v) {
        mp3Files.add(Mp3Model.fromJson(v));
      });
    }
  }
}

class Mp3Model {
  final String path;
  final String displayName;
  final String album;
  final String albumImage;
  final String artist;
  final String dateAdded;
  final String size;
  final String duration;

  Mp3Model(
      {this.path,
      this.displayName,
      this.album,
      this.albumImage,
      this.artist,
      this.dateAdded,
      this.size,
      this.duration});

  factory Mp3Model.fromJson(Map<String, dynamic> json) => Mp3Model(
        path: json["path"],
        displayName: json["displayName"],
        album: json["album"],
        albumImage: json["albumImage"],
        artist: json["artist"],
        dateAdded: json["dateAdded"],
        size: json["size"],
        duration: json["duration"],
      );
}
