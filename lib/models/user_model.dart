class UserModel {
  String name;
  String email;
  final String uid;
  String? profilePicture;
  final DateTime? createdAt;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    this.profilePicture,
    this.createdAt,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      uid: data['uid'] ?? '', // Ensure UID is not null
      name: data['name'] ?? 'Unknown User', // Provide a default name
      email: data['email'] ?? 'No Email', // Provide a default email
      profilePicture: data['profilePicture'], // Optional field
      createdAt:
          data['createdAt'] != null ? DateTime.parse(data['createdAt']) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'profilePicture': profilePicture,
      'createdAt': createdAt?.toIso8601String(),
    };
  }

  UserModel copyWith({
    String? name,
    String? email,
    String? profilePicture,
    DateTime? createdAt,
  }) {
    return UserModel(
      uid: uid,
      name: name ?? this.name,
      email: email ?? this.email,
      profilePicture: profilePicture ?? this.profilePicture,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
