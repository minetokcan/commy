import 'package:cloud_firestore/cloud_firestore.dart';

class CommentModel {
  final String comment;
  final String email;
  final DateTime date;

  CommentModel({
    required this.comment,
    required this.email,
    required this.date,
  });

  CommentModel copyWith({
    String? comment,
    String? email,
    DateTime? date,
  }) {
    return CommentModel(
      comment: comment ?? this.comment,
      email: email ?? this.email,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'comment': comment,
      'email': email,
      'date': FieldValue.serverTimestamp(),
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    late final DateTime date;
    if (map["date"] != null) {
      date = (map["date"] as Timestamp).toDate();
    } else {
      date = DateTime.now();
    }

    return CommentModel(
      comment: map['comment'] ?? '',
      email: map['email'] ?? '',
      date: date,
    );
  }

  @override
  String toString() => 'CommentModel(comment: $comment, email: $email, date: $date)';
}
