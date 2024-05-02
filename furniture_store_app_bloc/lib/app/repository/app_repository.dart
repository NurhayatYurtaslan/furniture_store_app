import 'package:flutter/material.dart';
import 'package:furniture_store_app_bloc/app/model/furniture.dart';
import 'package:furniture_store_app_bloc/core/constants/furniture_color.dart';
import 'package:furniture_store_app_bloc/gen/assets.gen.dart';

class Repository {
  get getFurnitureList {
    const dummyText =
        """Lorem Ipsum is simply dummy text of the printing and typesetting
       industry. Lorem Ipsum has been the industry's standard dummy text ever
        since the 1500s, when an unknown printer took a galley of type and
         scrambled it to make a type specimen book. It has survived not only 
         five centuries, but also the leap into electronic typesetting,
          remaining essentially unchanged. It was popularised in the 1960s with
           the release of Letraset sheets containing Lorem Ipsum passages,
            and more recently with desktop publishing software like Aldus
             PageMaker including versions of Lorem Ipsum.""";

    List<Furniture> furnitureList = [
      Furniture(
        id: 1,
        quantity: 1,
        isFavorite: false,
        title: 'Comhar All-in-One Standing Desk Glass',
        description: dummyText,
        price: 469.99,
        score: 3.5,
        images: [
          Assets.images.comharStandingDesk1.path,
          Assets.images.comharStandingDesk2.path,
          Assets.images.comharStandingDesk3.path,
          Assets.images.comharStandingDesk4.path,
          Assets.images.comharStandingDesk5.path,
          Assets.images.comharStandingDesk6.path,
          Assets.images.comharStandingDesk7.path,
        ],
        colors: <FurnitureColor>[
          FurnitureColor(color: const Color(0xFF616161), isSelected: true),
          FurnitureColor(color: const Color(0xFF424242)),
        ],
      ),
      Furniture(
        id: 2,
        isFavorite: false,
        quantity: 1,
        title: 'Ergonomic Gaming Desk with Mouse Pad',
        description: dummyText,
        price: 299.99,
        score: 4.5,
        images: [
          Assets.images.ergonomicGamingDesk1.path,
          Assets.images.ergonomicGamingDesk2.path,
          Assets.images.ergonomicGamingDesk3.path,
          Assets.images.ergonomicGamingDesk4.path,
          Assets.images.ergonomicGamingDesk5.path
        ],
        colors: <FurnitureColor>[
          FurnitureColor(color: const Color(0xFF5d4037), isSelected: true),
          FurnitureColor(color: const Color(0xFF424242)),
        ],
      ),
      Furniture(
        id: 3,
        quantity: 1,
        isFavorite: false,
        title: 'Kana Pro Bamboo Standing Desk',
        description: dummyText,
        price: 659.99,
        score: 3.0,
        images: [
          Assets.images.kanaBambooDesk1.path,
          Assets.images.kanaBambooDesk2.path,
          Assets.images.kanaBambooDesk3.path,
          Assets.images.kanaBambooDesk4.path,
          Assets.images.kanaBambooDesk5.path,
          Assets.images.kanaBambooDesk6.path,
        ],
        colors: <FurnitureColor>[
          FurnitureColor(color: const Color(0xFF616161), isSelected: true),
          FurnitureColor(color: const Color(0xFF212121)),
        ],
      ),
      Furniture(
        id: 4,
        quantity: 1,
        isFavorite: false,
        title: 'Soutien Ergonomic Office Chair',
        description: dummyText,
        price: 349.99,
        score: 2.5,
        images: [
          Assets.images.soutienOfficeChair1.path,
          Assets.images.soutienOfficeChair2.path,
          Assets.images.soutienOfficeChair3.path,
          Assets.images.soutienOfficeChair4.path,
          Assets.images.soutienOfficeChair5.path,
          Assets.images.soutienOfficeChair6.path,
        ],
        colors: <FurnitureColor>[
          FurnitureColor(color: const Color(0xFF455a64), isSelected: true),
          FurnitureColor(color: const Color(0xFF263238)),
        ],
      ),
      Furniture(
        id: 5,
        quantity: 1,
        isFavorite: false,
        title: 'Theodore Standing Desk',
        description: dummyText,
        price: 499.99,
        score: 2.8,
        images: [
          Assets.images.theodoreStandingDesk1.path,
          Assets.images.theodoreStandingDesk2.path,
          Assets.images.theodoreStandingDesk3.path,
          Assets.images.theodoreStandingDesk4.path,
          Assets.images.theodoreStandingDesk5.path,
        ],
        colors: <FurnitureColor>[
          FurnitureColor(color: const Color(0xFF5d4037), isSelected: true),
          FurnitureColor(color: const Color(0xFF455a64)),
        ],
      ),
    ];

    return furnitureList;
  }
}
