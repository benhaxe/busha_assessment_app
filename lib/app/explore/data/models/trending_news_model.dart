import 'package:busha_app/app/explore/domain/entities/trending_news.dart';

class TrendingNewsModel extends TrendingNews {
  const TrendingNewsModel({
    super.id,
    super.banner,
    super.title,
    super.channel,
    super.dateTime,
    super.isFeatured,
  });

  factory TrendingNewsModel.fromJson(Map<String, dynamic> json) {
    return TrendingNewsModel(
      id: json['id'],
      banner: json['banner'],
      title: json['title'],
      channel: json['channel'],
      dateTime: json['dateTime'],
      isFeatured: json['isFeatured'],
    );
  }
}
