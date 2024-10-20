class MixesResponse {
  List<Mixes>? mixes;

  MixesResponse({this.mixes});

  MixesResponse.fromJson(Map<String, dynamic> json) {
    if (json['mixes'] != null) {
      mixes = <Mixes>[];
      json['mixes'].forEach((v) {
        mixes!.add(Mixes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (mixes != null) {
      data['mixes'] = mixes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Mixes {
  String? id;
  String? title;
  String? description;
  String? slug;
  String? dj;
  String? duration;
  String? album;
  String? mixFile;
  String? dateCreated;
  String? dateProduced;
  String? djPhoto;
  String? albumImage;

  Mixes(
      {this.id,
      this.title,
      this.description,
      this.slug,
      this.dj,
      this.duration,
      this.album,
      this.mixFile,
      this.dateCreated,
      this.dateProduced,
      this.djPhoto,
      this.albumImage});

  Mixes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    slug = json['slug'];
    dj = json['dj'];
    duration = json['duration'];
    album = json['album'];
    mixFile = json['mix_file'];
    dateCreated = json['date_created'];
    dateProduced = json['date_produced'];
    djPhoto = json['dj_photo'];
    albumImage = json['album_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['slug'] = slug;
    data['dj'] = dj;
    data['duration'] = duration;
    data['album'] = album;
    data['mix_file'] = mixFile;
    data['date_created'] = dateCreated;
    data['date_produced'] = dateProduced;
    data['dj_photo'] = djPhoto;
    data['album_image'] = albumImage;
    return data;
  }
}
