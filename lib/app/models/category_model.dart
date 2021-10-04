import 'package:flutter/material.dart';

import 'e_service_model.dart';
import 'media_model.dart';
import 'parents/model.dart';

class Category extends Model {
  String id;
  String name;
  String description;
  Color color;
  Media image;
  bool featured;
  List<Category> subCategories;
  List<EService> eServices;

  Category({this.id, this.name, this.description, this.color, this.image, this.featured, this.subCategories, this.eServices});

  Category.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    name = stringFromJson(json, 'name');
    color = colorFromJson(json, 'color');
    description = stringFromJson(json, 'description');
    image = mediaFromJson(json, 'image');
    featured = boolFromJson(json, 'featured');
    eServices = listFromJson(json, ['e_services', 'featured_e_services'], (v) => EService.fromJson(v));
    subCategories = listFromJson(json, 'sub_categories', (v) => Category.fromJson(v));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['color'] = this.color.toString();
    return data;
  }
}
