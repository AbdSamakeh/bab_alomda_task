// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:top_story_nyt/core/widget/app_bar/main_app_bar.dart';

import '../../domain/entities/response/news_response_entite.dart';

class NewsPageDetails extends StatelessWidget {
  const NewsPageDetails({
    Key? key,
    required this.newsDetails,
  }) : super(key: key);
  final News newsDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: newsDetails.title,
        roundedShape: true,
      ),
      body: Column(),
    );
  }
}
