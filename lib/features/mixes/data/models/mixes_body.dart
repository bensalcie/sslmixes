class MixBody {
  int? page;
  int? limit;
  String? search;

  MixBody({this.page, this.limit, this.search});

  MixBody.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    limit = json['limit'];
    search = json['search'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['limit'] = limit;
    data['search'] = search;
    return data;
  }
}
