class NotificationResponse {
  int surveyid;
  String details;

  NotificationResponse({this.surveyid, this.details});

  NotificationResponse.fromJson(Map<String, dynamic> json) {
    surveyid = json['surveyid'];
    details = json['details'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['surveyid'] = this.surveyid;
    data['details'] = this.details;
    return data;
  }
}