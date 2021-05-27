class FaqModel {
    List<FaqPost> post;

    FaqModel({this.post});

    factory FaqModel.fromJson(Map<String, dynamic> json) {
        return FaqModel(
            post: json['post'] != null ? (json['post'] as List).map((i) => FaqPost.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.post != null) {
            data['post'] = this.post.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class FaqPost {
    String answer;
    int id;
    String question;

    FaqPost({this.answer, this.id, this.question});

    factory FaqPost.fromJson(Map<String, dynamic> json) {
        return FaqPost(
            answer: json['answer'], 
            id: json['id'], 
            question: json['question'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['answer'] = this.answer;
        data['id'] = this.id;
        data['question'] = this.question;
        return data;
    }
}