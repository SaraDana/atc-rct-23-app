import 'package:app/models/recommended_post_model.dart';


class VitalMomentRecommendedPostModel extends RecommendedPostModel{
  int? relatedWeek;
  VitalMomentRecommendedPostModel({
    super.publication,
    super.day,
    this.relatedWeek,
  });
}
