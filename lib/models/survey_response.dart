class SurveyResponse {
  String title;
  String description;
  double time;
  int numberofpoints;
  String link;

  SurveyResponse(
      {this.title,
        this.description,
        this.time,
        this.numberofpoints,
        this.link});

  SurveyResponse.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    time = json['time'];
    numberofpoints = json['numberofpoints'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['time'] = this.time;
    data['numberofpoints'] = this.numberofpoints;
    data['link'] = this.link;
    return data;
  }
}