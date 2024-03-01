class Location {
	String? name;
	String? url;

	Location({this.name, this.url});

	factory Location.fromJson(Map<String, dynamic> json) => Location(
				name: json['name'] as String?,
				url: json['url'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'name': name,
				'url': url,
			};
}
