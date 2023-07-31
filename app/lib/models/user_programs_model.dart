class UserPrograms {
  String? userId;
  String? programId;
  int? initialRate;
  int? finalRate;
  int? programRate;

  UserPrograms(
      {this.userId,
      this.programId,
      this.initialRate,
      this.finalRate,
      this.programRate});

  UserPrograms.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    programId = json['programId'];
    initialRate = json['initialRate'];
    finalRate = json['finalRate'];
    programRate = json['programRate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['programId'] = this.programId;
    data['initialRate'] = this.initialRate;
    data['finalRate'] = this.finalRate;
    data['programRate'] = this.programRate;
    return data;
  }
}
