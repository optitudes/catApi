class CAPLVotationBreed {
    String? name;
    String? temperament;
    String? origin;
    String? description;
    Image? image;
}
class Image {
  String? id;
  int? width;
  int? height;
  String? url;

  Image({this.id, this.width, this.height, this.url});
}