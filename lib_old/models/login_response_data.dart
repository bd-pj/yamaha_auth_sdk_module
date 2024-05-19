class LoginResponseData {
  final Links _links;
  final String tokenAuth;

  LoginResponseData({required Links links, required this.tokenAuth})
      : _links = links;

  Links get links => _links;

  factory LoginResponseData.fromJson(Map<String, dynamic> json) {
    return LoginResponseData(
      links: Links.fromJson(json['_links']),
      tokenAuth: json['tokenAuth'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        '_links': _links.toJson(),
        'tokenAuth': tokenAuth,
      };
}

class Links {
  final Self self;

  Links({required this.self});

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(self: Self.fromJson(json['self']));
  }

  Map<String, dynamic> toJson() => {'self': self.toJson()};
}

class Self {
  final String href;
  final String loginId;

  Self({required this.href, required this.loginId});

  factory Self.fromJson(Map<String, dynamic> json) {
    return Self(
      href: json['href'] as String,
      loginId: json['login_id'] as String,
    );
  }

  Map<String, dynamic> toJson() => {'href': href, 'login_id': loginId};
}
