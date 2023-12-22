class DailySleep {
  String? id;
  String? userId;
  String? sleepStart;
  String? sleepEnd;
  double? sleepDuration;
  int? sleepQuality;
  double? dailyScoring;
  String? sleepResult;
  String? createdAt;
  String? updatedAt;

  DailySleep(
      {this.id,
      this.userId,
      this.sleepStart,
      this.sleepEnd,
      this.sleepDuration,
      this.sleepQuality,
      this.dailyScoring,
      this.sleepResult,
      this.createdAt,
      this.updatedAt});

  DailySleep.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    sleepStart = json['sleep_start'];
    sleepEnd = json['sleep_end'];
    // sleepDuration = json['sleep_duration'] == 0 ? 0.0 : json['sleep_duration'];
    sleepDuration = json['sleep_duration']?.toDouble();
    sleepQuality = json['sleep_quality'];
    dailyScoring = json['daily_scoring'];
    sleepResult = json['sleep_result'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['sleep_start'] = this.sleepStart;
    data['sleep_end'] = this.sleepEnd;
    data['sleep_duration'] = this.sleepDuration;
    data['sleep_quality'] = this.sleepQuality;
    data['daily_scoring'] = this.dailyScoring;
    data['sleep_result'] = this.sleepResult;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
