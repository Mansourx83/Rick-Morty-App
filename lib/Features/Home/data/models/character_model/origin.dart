class Origin {
	String? name;
	String? url;

	Origin({this.name, this.url});

	factory Origin.fromJson(Map<String, dynamic> json) => Origin(
				name: json['name'] as String?,
				url: json['url'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'name': name,
				'url': url,
			};
}
