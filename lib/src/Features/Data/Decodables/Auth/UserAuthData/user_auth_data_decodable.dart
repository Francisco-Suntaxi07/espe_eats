import 'dart:convert';

class UserAuthDataDecodable {
    List<User>? users;

    UserAuthDataDecodable({
        this.users,
    });

    factory UserAuthDataDecodable.fromJson(String str) => UserAuthDataDecodable.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UserAuthDataDecodable.fromMap(Map<String, dynamic> json) => UserAuthDataDecodable(
        users: json["users"] == null ? [] : List<User>.from(json["users"]!.map((x) => User.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "users": users == null ? [] : List<dynamic>.from(users!.map((x) => x.toMap())),
    };
}

class User {
    String? localId;
    String? email;
    bool? emailVerified;
    String? displayName;
    List<ProviderUserInfo>? providerUserInfo;
    String? photoUrl;
    String? passwordHash;
    int? passwordUpdatedAt;
    String? validSince;
    bool? disabled;
    String? lastLoginAt;
    String? createdAt;
    bool? customAuth;

    User({
        this.localId,
        this.email,
        this.emailVerified,
        this.displayName,
        this.providerUserInfo,
        this.photoUrl,
        this.passwordHash,
        this.passwordUpdatedAt,
        this.validSince,
        this.disabled,
        this.lastLoginAt,
        this.createdAt,
        this.customAuth,
    });

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        localId: json["localId"],
        email: json["email"],
        emailVerified: json["emailVerified"],
        displayName: json["displayName"],
        providerUserInfo: json["providerUserInfo"] == null ? [] : List<ProviderUserInfo>.from(json["providerUserInfo"]!.map((x) => ProviderUserInfo.fromMap(x))),
        photoUrl: json["photoUrl"],
        passwordHash: json["passwordHash"],
        passwordUpdatedAt: json["passwordUpdatedAt"],
        validSince: json["validSince"],
        disabled: json["disabled"],
        lastLoginAt: json["lastLoginAt"],
        createdAt: json["createdAt"],
        customAuth: json["customAuth"],
    );

    Map<String, dynamic> toMap() => {
        "localId": localId,
        "email": email,
        "emailVerified": emailVerified,
        "displayName": displayName,
        "providerUserInfo": providerUserInfo == null ? [] : List<dynamic>.from(providerUserInfo!.map((x) => x.toMap())),
        "photoUrl": photoUrl,
        "passwordHash": passwordHash,
        "passwordUpdatedAt": passwordUpdatedAt,
        "validSince": validSince,
        "disabled": disabled,
        "lastLoginAt": lastLoginAt,
        "createdAt": createdAt,
        "customAuth": customAuth,
    };
}

class ProviderUserInfo {
    String? providerId;
    String? displayName;
    String? photoUrl;
    String? federatedId;
    String? email;
    String? rawId;
    String? screenName;

    ProviderUserInfo({
        this.providerId,
        this.displayName,
        this.photoUrl,
        this.federatedId,
        this.email,
        this.rawId,
        this.screenName,
    });

    factory ProviderUserInfo.fromJson(String str) => ProviderUserInfo.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProviderUserInfo.fromMap(Map<String, dynamic> json) => ProviderUserInfo(
        providerId: json["providerId"],
        displayName: json["displayName"],
        photoUrl: json["photoUrl"],
        federatedId: json["federatedId"],
        email: json["email"],
        rawId: json["rawId"],
        screenName: json["screenName"],
    );

    Map<String, dynamic> toMap() => {
        "providerId": providerId,
        "displayName": displayName,
        "photoUrl": photoUrl,
        "federatedId": federatedId,
        "email": email,
        "rawId": rawId,
        "screenName": screenName,
    };
}
