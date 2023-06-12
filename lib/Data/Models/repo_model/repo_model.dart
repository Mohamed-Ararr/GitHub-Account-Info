import 'package:equatable/equatable.dart';

class RepoModel extends Equatable {
  final int? id;
  final String? name;
  final String? description;
  final String? languagesUrl;
  final int? starsCount;
  final String? createdAt;
  final String? updatedAt;
  final String? pushedAt;
  final int? forksCount;
  final String? visibility;

  const RepoModel({
    this.id,
    this.name,
    this.description,
    this.languagesUrl,
    this.starsCount,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
    this.forksCount,
    this.visibility,
  });

  factory RepoModel.fromJson(Map<String, dynamic> json) => RepoModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        languagesUrl: json['languages_url'] as String?,
        starsCount: json['stargazers_count'] as int?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        pushedAt: json['pushed_at'] as String?,
        forksCount: json['forks_count'] as int?,
        visibility: json['visibility'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'languages_url': languagesUrl,
        'stargazers_count': starsCount,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'pushed_at': pushedAt,
        'forks_count': forksCount,
        'visibility': visibility,
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      description,
      languagesUrl,
      starsCount,
      createdAt,
      updatedAt,
      pushedAt,
      forksCount,
      visibility,
    ];
  }
}
