class Post {
  String status;
  String message;
  List<Data> data;

  Post({this.status, this.message, this.data});

  Post.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String namaCategory;
  String idBrand;
  String sortId;
  String sku;
  String nama;
  String detail;
  String price;
  String normalPrice;
  String status;
  String img;
  String customizable;
  List<CustomizableCategory> customizableCategory;

  Data(
      {this.namaCategory,
      this.idBrand,
      this.sortId,
      this.sku,
      this.nama,
      this.detail,
      this.price,
      this.normalPrice,
      this.status,
      this.img,
      this.customizable,
      this.customizableCategory});

  Data.fromJson(Map<String, dynamic> json) {
    namaCategory = json['nama_category'];
    idBrand = json['id_brand'];
    sortId = json['sort_id'];
    sku = json['sku'];
    nama = json['nama'];
    detail = json['detail'];
    price = json['price'];
    normalPrice = json['normal_price'];
    status = json['status'];
    img = json['img'];
    customizable = json['customizable'];
    if (json['customizable_category'] != null) {
      customizableCategory = new List<CustomizableCategory>();
      json['customizable_category'].forEach((v) {
        customizableCategory.add(new CustomizableCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama_category'] = this.namaCategory;
    data['id_brand'] = this.idBrand;
    data['sort_id'] = this.sortId;
    data['sku'] = this.sku;
    data['nama'] = this.nama;
    data['detail'] = this.detail;
    data['price'] = this.price;
    data['normal_price'] = this.normalPrice;
    data['status'] = this.status;
    data['img'] = this.img;
    data['customizable'] = this.customizable;
    if (this.customizableCategory != null) {
      data['customizable_category'] =
          this.customizableCategory.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomizableCategory {
  String customizableCategoryId;
  String customizableCategoryName;
  String customizableCategoryMaxPicked;
  String customizableCategoryType;
  List<CustomizableCategoryOption> customizableCategoryOption;

  CustomizableCategory(
      {this.customizableCategoryId,
      this.customizableCategoryName,
      this.customizableCategoryMaxPicked,
      this.customizableCategoryType,
      this.customizableCategoryOption});

  CustomizableCategory.fromJson(Map<String, dynamic> json) {
    customizableCategoryId = json['customizable_category_id'];
    customizableCategoryName = json['customizable_category_name'];
    customizableCategoryMaxPicked = json['customizable_category_max_picked'];
    customizableCategoryType = json['customizable_category_type'];
    if (json['customizable_category_option'] != null) {
      customizableCategoryOption = new List<CustomizableCategoryOption>();
      json['customizable_category_option'].forEach((v) {
        customizableCategoryOption
            .add(new CustomizableCategoryOption.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customizable_category_id'] = this.customizableCategoryId;
    data['customizable_category_name'] = this.customizableCategoryName;
    data['customizable_category_max_picked'] =
        this.customizableCategoryMaxPicked;
    data['customizable_category_type'] = this.customizableCategoryType;
    if (this.customizableCategoryOption != null) {
      data['customizable_category_option'] =
          this.customizableCategoryOption.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomizableCategoryOption {
  String optionSku;
  String optionPrice;
  String optionNormalPrice;
  String optionName;
  String optionDefault;

  CustomizableCategoryOption(
      {this.optionSku,
      this.optionPrice,
      this.optionNormalPrice,
      this.optionName,
      this.optionDefault});

  CustomizableCategoryOption.fromJson(Map<String, dynamic> json) {
    optionSku = json['option_sku'];
    optionPrice = json['option_price'];
    optionNormalPrice = json['option_normal_price'];
    optionName = json['option_name'];
    optionDefault = json['option_default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['option_sku'] = this.optionSku;
    data['option_price'] = this.optionPrice;
    data['option_normal_price'] = this.optionNormalPrice;
    data['option_name'] = this.optionName;
    data['option_default'] = this.optionDefault;
    return data;
  }
}
