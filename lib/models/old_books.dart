class OldBook {
  int id;
  int isOpen;
  String title;
  String authorName;
  int price;
  String sellerName;
  String sellerEmail;
  String sellerContact;
  String condition;
  String createdAt;
  String updatedAt;

  OldBook(
      {this.id,
        this.isOpen,
        this.title,
        this.authorName,
        this.price,
        this.sellerName,
        this.sellerEmail,
        this.sellerContact,
        this.condition,
        this.createdAt,
        this.updatedAt});

  OldBook.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isOpen = json['isOpen'];
    title = json['title'];
    authorName = json['authorName'];
    price = json['price'];
    sellerName = json['sellerName'];
    sellerEmail = json['sellerEmail'];
    sellerContact = json['sellerContact'];
    condition = json['condition'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['isOpen'] = this.isOpen;
    data['title'] = this.title;
    data['authorName'] = this.authorName;
    data['price'] = this.price;
    data['sellerName'] = this.sellerName;
    data['sellerEmail'] = this.sellerEmail;
    data['sellerContact'] = this.sellerContact;
    data['condition'] = this.condition;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}