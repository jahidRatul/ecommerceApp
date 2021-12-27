import 'package:ecommerce_app/core/api/http_rerquest.dart';

class CategoryProductListModel {
  List<Products>? products;

  CategoryProductListModel({this.products});

  CategoryProductListModel.fromJson(Map<String, dynamic> json) {
    this._fromJson(json);
  }
  _fromJson(Map<String, dynamic> json) {
    try {
      if (json['products'] != null) {
        products = <Products>[];
        json['products'].forEach((v) {
          products!.add(new Products.fromJson(v));
        });
      }
    } catch (e, t) {
      print(e);
      print(t);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Future<void> callApi({String? categoryProductsUrl}) async {
    try {
      Map<String, dynamic>? res = await HttpHelper.get(
        categoryProductsUrl ?? '',
        headers: {
          'Content-Type': 'application/json',
          'Charset': 'utf-8',
        },
      );

      if (res == null) return;
      if (res.isEmpty) return;

      return this._fromJson(res);
    } catch (e, t) {
      print(e);
      print(t);
    }
  }
}

class Products {
  int? id;
  String? sku;
  String? productType;
  dynamic affiliateLink;
  int? userId;
  int? categoryId;
  int? subcategoryId;
  int? childcategoryId;
  dynamic attributes;
  String? name;
  String? slug;
  String? photo;
  String? thumbnail;
  dynamic file;
  dynamic size;
  dynamic sizeQty;
  String? sizePrice;
  String? color;
  dynamic price;
  int? previousPrice;
  String? details;
  dynamic stock;
  String? policy;
  int? status;
  int? views;
  // List<String>? tags;
  // List<String>? features;
  // List<String>? colors;
  int? productCondition;
  String? ship;
  int? isMeta;
  // List<String>? metaTag;
  String? metaDescription;
  dynamic youtube;
  String? type;
  String? license;
  String? licenseQty;
  dynamic link;
  dynamic platform;
  dynamic region;
  dynamic licenceType;
  dynamic measure;
  int? featured;
  int? best;
  int? top;
  int? hot;
  int? latest;
  int? big;
  int? trending;
  int? sale;
  String? createdAt;
  String? updatedAt;
  int? isDiscount;
  dynamic discountDate;
  String? wholeSellQty;
  String? wholeSellDiscount;
  int? isCatalog;
  int? catalogId;

  Products(
      {this.id,
      this.sku,
      this.productType,
      this.affiliateLink,
      this.userId,
      this.categoryId,
      this.subcategoryId,
      this.childcategoryId,
      this.attributes,
      this.name,
      this.slug,
      this.photo,
      this.thumbnail,
      this.file,
      this.size,
      this.sizeQty,
      this.sizePrice,
      this.color,
      this.price,
      this.previousPrice,
      this.details,
      this.stock,
      this.policy,
      this.status,
      this.views,
      // this.tags,
      // this.features,
      // this.colors,
      this.productCondition,
      this.ship,
      this.isMeta,
      // this.metaTag,
      this.metaDescription,
      this.youtube,
      this.type,
      this.license,
      this.licenseQty,
      this.link,
      this.platform,
      this.region,
      this.licenceType,
      this.measure,
      this.featured,
      this.best,
      this.top,
      this.hot,
      this.latest,
      this.big,
      this.trending,
      this.sale,
      this.createdAt,
      this.updatedAt,
      this.isDiscount,
      this.discountDate,
      this.wholeSellQty,
      this.wholeSellDiscount,
      this.isCatalog,
      this.catalogId});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sku = json['sku'];
    productType = json['product_type'];
    affiliateLink = json['affiliate_link'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    childcategoryId = json['childcategory_id'];
    attributes = json['attributes'];
    name = json['name'];
    slug = json['slug'];
    photo = json['photo'];
    thumbnail = json['thumbnail'];
    file = json['file'];
    size = json['size'];
    sizeQty = json['size_qty'];
    sizePrice = json['size_price'];
    color = json['color'];
    price = json['price'];
    previousPrice = json['previous_price'];
    details = json['details'];
    stock = json['stock'];
    policy = json['policy'];
    status = json['status'];
    views = json['views'];
    // tags = json['tags'].cast<String>();
    // features = json['features'].cast<String>();
    // colors = json['colors'].cast<String>();
    productCondition = json['product_condition'];
    ship = json['ship'];
    isMeta = json['is_meta'];
    // metaTag = json['meta_tag'].cast<String>();
    metaDescription = json['meta_description'];
    youtube = json['youtube'];
    type = json['type'];
    license = json['license'];
    licenseQty = json['license_qty'];
    link = json['link'];
    platform = json['platform'];
    region = json['region'];
    licenceType = json['licence_type'];
    measure = json['measure'];
    featured = json['featured'];
    best = json['best'];
    top = json['top'];
    hot = json['hot'];
    latest = json['latest'];
    big = json['big'];
    trending = json['trending'];
    sale = json['sale'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isDiscount = json['is_discount'];
    discountDate = json['discount_date'];
    wholeSellQty = json['whole_sell_qty'];
    wholeSellDiscount = json['whole_sell_discount'];
    isCatalog = json['is_catalog'];
    catalogId = json['catalog_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sku'] = this.sku;
    data['product_type'] = this.productType;
    data['affiliate_link'] = this.affiliateLink;
    data['user_id'] = this.userId;
    data['category_id'] = this.categoryId;
    data['subcategory_id'] = this.subcategoryId;
    data['childcategory_id'] = this.childcategoryId;
    data['attributes'] = this.attributes;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['photo'] = this.photo;
    data['thumbnail'] = this.thumbnail;
    data['file'] = this.file;
    data['size'] = this.size;
    data['size_qty'] = this.sizeQty;
    data['size_price'] = this.sizePrice;
    data['color'] = this.color;
    data['price'] = this.price;
    data['previous_price'] = this.previousPrice;
    data['details'] = this.details;
    data['stock'] = this.stock;
    data['policy'] = this.policy;
    data['status'] = this.status;
    data['views'] = this.views;
    // data['tags'] = this.tags;
    // data['features'] = this.features;
    // data['colors'] = this.colors;
    data['product_condition'] = this.productCondition;
    data['ship'] = this.ship;
    data['is_meta'] = this.isMeta;
    // data['meta_tag'] = this.metaTag;
    data['meta_description'] = this.metaDescription;
    data['youtube'] = this.youtube;
    data['type'] = this.type;
    data['license'] = this.license;
    data['license_qty'] = this.licenseQty;
    data['link'] = this.link;
    data['platform'] = this.platform;
    data['region'] = this.region;
    data['licence_type'] = this.licenceType;
    data['measure'] = this.measure;
    data['featured'] = this.featured;
    data['best'] = this.best;
    data['top'] = this.top;
    data['hot'] = this.hot;
    data['latest'] = this.latest;
    data['big'] = this.big;
    data['trending'] = this.trending;
    data['sale'] = this.sale;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_discount'] = this.isDiscount;
    data['discount_date'] = this.discountDate;
    data['whole_sell_qty'] = this.wholeSellQty;
    data['whole_sell_discount'] = this.wholeSellDiscount;
    data['is_catalog'] = this.isCatalog;
    data['catalog_id'] = this.catalogId;
    return data;
  }
}
