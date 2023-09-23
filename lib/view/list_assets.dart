import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../viewmodel/assets_viewmodel.dart';
import 'component/asset_tile.dart';

class ListAssets extends StatefulWidget {
  final AssetsViewModel assetsViewModel;
  const ListAssets({Key? key, required this.assetsViewModel}) : super(key: key);

  @override
  State<ListAssets> createState() => _ListAssetsState();
}

class _ListAssetsState extends State<ListAssets> {
  @override
  void initState() {
    Provider.of<AssetsViewModel>(context, listen: false).fetchAsset();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          Provider.of<AssetsViewModel>(context, listen: false).fetchAsset();
        },
        child: ListView.builder(
          itemCount: widget.assetsViewModel.assets.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Provider.of<AssetsViewModel>(context, listen: false)
                    .setAsset(widget.assetsViewModel.assets[index]);
                context.push('/detail-asset');
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: AssetTile(
                  asset: widget.assetsViewModel.assets[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
