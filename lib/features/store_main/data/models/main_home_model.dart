import 'package:equatable/equatable.dart';
import 'package:mystore/features/store_main/data/models/sub_models/contact_options.dart';
import 'package:mystore/features/store_main/data/models/sub_models/default_address_model.dart';
import 'package:mystore/features/store_main/data/models/sub_models/slide.dart';
import 'package:mystore/features/store_main/data/models/sub_models/store_categories.dart';

class MainHomeModel extends Equatable {
  final List<ContactOptionsModel> contactOptions;
  final List<SlideModel> slides;
  final List<StoreCategoriesModel> storeCategories;
  final List<DefaultAddressModel> defaultAddresses;

  @override
  // TODO: implement props

  @override
  List<Object?> get props {
    return [
      contactOptions,
      slides,
      storeCategories,
      defaultAddresses,
    ];
  }

  MainHomeModel({
    required this.contactOptions,
    required this.slides,
    required this.storeCategories,
    required this.defaultAddresses,
  });

  factory MainHomeModel.fromJson(Map<String, dynamic> json) {
    return MainHomeModel(
      contactOptions: (json['contact_options'] as List)
          .map((e) => ContactOptionsModel.fromJson(e))
          .toList(),
      slides:
          (json['slider'] as List).map((e) => SlideModel.fromJson(e)).toList(),
      storeCategories: (json['categories'] as List)
          .map((e) => StoreCategoriesModel.fromJson(e))
          .toList(),
      defaultAddresses: (json['defaultAddress'] as List)
          .map((e) => DefaultAddressModel.fromJson(e))
          .toList(),
    );
  }
}
