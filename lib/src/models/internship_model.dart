class Internship {
  String id;
  String title;
  String description;
  String company;
  String location;
  String imageUrl;
  Internship(
      {required this.id,
      required this.title,
      required this.description,
      required this.company,
      required this.location,
      required this.imageUrl});

  factory Internship.fromJson(Map<String, dynamic> json) {
    return Internship(
        id: json["internships"]["_id"],
        title: json["internships"]["title"],
        description: json["internships"]["description"],
        company: json["internships"]["company"],
        location: json["internships"]["location"],
        imageUrl: json["internships"]["imageUrl"]);
  }

  static List<Internship> samples = [
    Internship(
        id: "",
        title: "Admin Sys",
        description: "Lorem ipsm",
        company: "Technova",
        location: "Mahajanga",
        imageUrl: "https://picsum.photos/200/300"),
    Internship(
        id: "",
        title: "Commercial",
        description: "Lorem ipsm",
        company: "Technova",
        location: "Mahajanga",
        imageUrl: "https://picsum.photos/200/300"),
    Internship(
        id: "",
        title: "QA",
        description: "Lorem ipsm",
        company: "Technova",
        location: "Mahajanga",
        imageUrl: "https://picsum.photos/200/300"),
    Internship(
        id: "",
        title: "Dev React",
        description: "Lorem ipsm",
        company: "Technova",
        location: "Mahajanga",
        imageUrl: "https://picsum.photos/200/300"),
    Internship(
        id: "",
        title: "Conseiller client",
        description: "Lorem ipsm",
        company: "Technova",
        location: "Mahajanga",
        imageUrl: "https://picsum.photos/200/300"),
    Internship(
        id: "",
        title: "Assistant marketing",
        description: "Lorem ipsm",
        company: "Technova",
        location: "Mahajanga",
        imageUrl: "https://picsum.photos/200/300"),
    Internship(
        id: "",
        title: "Gestionnaire logistique",
        description: "Lorem ipsm",
        company: "Technova",
        location: "Mahajanga",
        imageUrl: "https://picsum.photos/200/300"),
    Internship(
        id: "",
        title: "Dev flutter",
        description: "Lorem ipsm",
        company: "Technova",
        location: "Mahajanga",
        imageUrl: "https://picsum.photos/200/300"),
    Internship(
        id: "",
        title: "Javascript Developer",
        description: "Lorem ipsm",
        company: "Technova",
        location: "Mahajanga",
        imageUrl: "https://picsum.photos/200/300"),
  ];
}
