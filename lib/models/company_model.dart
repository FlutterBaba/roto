class CompanyModel {
  // final int id;
  final String nameku;
  // final String nameAr;
  // final String nameEn;
  // final String image;
  // final int view;
  // final int cityId;
  // final String descriptionKu;
  // final String descriptionAr;
  // final String descriptionEn;
  // final int userId;
  // final int createdBy;
  // final String createdAt;
  // final String updatedAt;

  CompanyModel({
    // required this.id,
    required this.nameku,
    // required this.nameAr,
    // required this.nameEn,
    // required this.image,
    // required this.view,
    // required this.cityId,
    // required this.descriptionKu,
    // required this.descriptionAr,
    // required this.descriptionEn,
    // required this.userId,
    // required this.createdBy,
    // required this.createdAt,
    // required this.updatedAt,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      // id: json['id'],
      nameku: json['name_ku'],
      // nameAr: json['name_ar'],
      // nameEn: json['name_en'],
      // image: json['image'],
      // view: json['view'],
      // cityId: json['city_id'],
      // descriptionKu: json["description_ku"],
      // descriptionAr: json['description_ar'],
      // descriptionEn: json["description_en"],
      // userId: json['user_id'],
      // createdBy: json["created_by"],
      // createdAt: json['created_at'],
      // updatedAt: json["updated_at"],
    );
  }
}
