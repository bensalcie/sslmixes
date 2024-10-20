import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:sslmixes/core/common/utils/string_utils.dart';
import 'package:sslmixes/features/mixes/data/models/mixes_response.dart';
import 'package:sslmixes/features/mixes/presentation/widgets/app_textview_small.dart';

class SingleMixCard extends StatefulWidget {
  const SingleMixCard({
    super.key,
    required this.mixes,
    required this.index,
  });

  final List<Mixes> mixes;
  final int index;

  @override
  State<SingleMixCard> createState() => _SingleMixCardState();
}

class _SingleMixCardState extends State<SingleMixCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        showAboutDialog(context: context);
      },
      child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
                imageUrl:
                    '$IMAGE_BASE_URL${widget.mixes[widget.index].albumImage}',
                placeholder: (context, url) => Icon(
                  Icons.image,
                  size: 150,
                  color: Colors.grey[400],
                ),
                errorWidget: (context, url, error) => const Icon(Icons.image),
              ),
              AppTextViewSubtitleSmall(
                padding: 10,
                text: widget.mixes[widget.index].title ?? '',
                textAlign: TextAlign.start,
                maxLines: 2,
              )
            ],
          )),
    );
  }
}
