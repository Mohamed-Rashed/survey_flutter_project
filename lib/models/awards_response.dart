class AwardsResponse {
  int rewardid;
  String title;
  String description;
  String code;
  int correspondingnumberofpoints;

  AwardsResponse(
      {this.rewardid,
        this.title,
        this.description,
        this.code,
        this.correspondingnumberofpoints});

  AwardsResponse.fromJson(Map<String, dynamic> json) {
    rewardid = json['rewardid'];
    title = json['title'];
    description = json['description'];
    code = json['code'];
    correspondingnumberofpoints = json['correspondingnumberofpoints'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rewardid'] = this.rewardid;
    data['title'] = this.title;
    data['description'] = this.description;
    data['code'] = this.code;
    data['correspondingnumberofpoints'] = this.correspondingnumberofpoints;
    return data;
  }
}