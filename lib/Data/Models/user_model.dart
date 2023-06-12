import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? login;
  final int? id;
  final String? avatarUrl;
  final String? followersUrl;
  final String? followingUrl;
  final String? reposUrl;
  final String? name;

  final String? bio;

  final int? followers;
  final int? following;
  final String? createdAt;
  final String? updatedAt;

  const UserModel({
    this.login,
    this.id,
    this.avatarUrl,
    this.followersUrl,
    this.followingUrl,
    this.reposUrl,
    this.name,
    this.bio,
    this.followers,
    this.following,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        login: json['login'] as String?,
        id: json['id'] as int?,
        avatarUrl: json['avatar_url'] as String?,
        followersUrl: json['followers_url'] as String?,
        followingUrl: json['following_url'] as String?,
        reposUrl: json['repos_url'] as String?,
        name: json['name'] as String?,
        bio: json['bio'] as String?,
        followers: json['followers'] as int?,
        following: json['following'] as int?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'login': login,
        'id': id,
        'avatar_url': avatarUrl,
        'followers_url': followersUrl,
        'following_url': followingUrl,
        'repos_url': reposUrl,
        'name': name,
        'bio': bio,
        'followers': followers,
        'following': following,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };

  @override
  List<Object?> get props {
    return [
      login,
      id,
      avatarUrl,
      followersUrl,
      followingUrl,
      reposUrl,
      name,
      bio,
      followers,
      following,
      createdAt,
      updatedAt,
    ];
  }
}
