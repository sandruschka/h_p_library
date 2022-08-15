import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:h_p_library/controllers/catalog_controller.dart';
import 'package:h_p_library/di/global_providers.dart';
import 'package:h_p_library/models/book_model.dart';
import 'package:h_p_library/widgets/molecules/catalog_card_widget.dart';
import 'package:shimmer/shimmer.dart';

class CatalogView extends StatelessWidget {
  CatalogView({Key? key}) : super(key: key);
  final CatalogController catalogController = getIt<CatalogController>()
    ..getCatalog();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: Theme.of(context).colorScheme.background,
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: CachedNetworkImage(
                  imageUrl:
                      'https://i.pinimg.com/originals/53/47/47/534747ec44bc8ba510aeec3532693834.png',
                ),
              ),
              ListTile(
                title: Text('gryffindor_theme'.tr()),
                trailing: Switch(
                  activeColor: const Color.fromRGBO(238, 186, 48, 1),
                  value: true,
                  onChanged: (value) {},
                ),
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<List<Book>?>(
            stream: catalogController.books,
            builder: (context, snapshot) {
              List<Book>? books = snapshot.data;
              return ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: books?.length ?? 3,
                itemBuilder: (BuildContext context, int index) {
                  if (books == null) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.withOpacity(0.8),
                      highlightColor: Colors.grey.withOpacity(0.6),
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                    );
                  }
                  return CatalogCard(book: books[index]);
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(height: 4),
              );
            },
          ),
        ),
      ),
    );
  }
}
