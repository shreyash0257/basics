import 'package:basics/models/category_model.dart';

List<CategoryModel> getCategories() {

  List<CategoryModel> category = [];
  CategoryModel categoryModel;

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Business";
  categoryModel.imageURL = "https://i.imgur.com/ScABm9N.jpeg";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.imageURL = "https://www.intofilm.org/intofilm-production/9628/scaledcropped/630x355/resources/9628/into-film-plus-catalogue-image-07-22.jpg";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "General";
  categoryModel.imageURL = "https://www.shutterstock.com/shutterstock/videos/1009424822/thumb/11.jpg?ip=x480";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Health";
  categoryModel.imageURL = "https://images.everydayhealth.com/homepage/health-topics-2.jpg?w=720";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Science";
  categoryModel.imageURL = "https://www.un.org/sites/un2.un.org/files/2022/11/human-dna-chromosome.jpg";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Sports";
  categoryModel.imageURL = "https://media.gq.com/photos/59e76a0566e2d56abcd79e99/4:3/w_2664,h_1998,c_limit/GQ_50Greatest_final_v2.jpg";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Technology";
  categoryModel.imageURL = "https://www.usnews.com/object/image/0000016b-e1d5-d947-a56f-f1dd01a90000/businesswoman.jpg?update-time=1562862186324&size=responsive640";
  category.add(categoryModel);

  return category;

}