import 'package:flutter/material.dart';
import 'package:h_p_library/controllers/catalog_controller.dart';
import 'package:h_p_library/di/global_providers.dart';
import 'package:h_p_library/models/book_model.dart';
import 'package:h_p_library/widgets/molecules/catalog_card_widget.dart';
import 'package:shimmer/shimmer.dart';

class CatalogView extends StatefulWidget {
  const CatalogView({Key? key}) : super(key: key);

  @override
  State<CatalogView> createState() => _CatalogViewState();
}

class _CatalogViewState extends State<CatalogView> {
  final CatalogController catalogController = getIt<CatalogController>()
    ..getCatalog();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Catalog View'),
          automaticallyImplyLeading: false,
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
                      baseColor: Colors.grey.withOpacity(0.2),
                      highlightColor: Colors.grey.withOpacity(0.1),
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
