// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import 'package:top_story_nyt/core/resource/color_manger.dart';
import 'package:top_story_nyt/core/resource/enum_manger.dart';
import 'package:top_story_nyt/core/resource/font_manger.dart';
import 'package:top_story_nyt/core/resource/lottie_manager.dart';
import 'package:top_story_nyt/core/resource/size_manger.dart';
import 'package:top_story_nyt/core/widget/button/refresh_button.dart';
import 'package:top_story_nyt/core/widget/list_view/pagination_list_view_separated.dart';
import 'package:top_story_nyt/core/widget/snack_bar/note_message.dart';
import 'package:top_story_nyt/core/widget/text/app_text_widget.dart';
import 'package:top_story_nyt/features/news/presentation/cubit/news_cubit/news_cubit.dart';
import 'package:top_story_nyt/features/news/presentation/widgets/home_app_bar.dart';
import 'package:top_story_nyt/features/news/presentation/widgets/news_list_itme_widget.dart';
import 'package:top_story_nyt/generated/locale_keys.g.dart';

import '../../../../core/widget/list_view/pagination_grid_view.dart';
import '../../domain/entities/response/news_response_entite.dart';
import '../widgets/filter_drop_down_widget.dart';
import '../widgets/loading_news_grid_item.dart';
import '../widgets/loading_news_item_widget.dart';
import '../widgets/news_grid_item_widget.dart';
import '../widgets/toggle_language_button.dart';
import '../widgets/toggle_theme_button.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  //List Style Bolean Switcher
  bool isGridView = false;
  //News List
  List<News> newsList = [];
  List<PopupMenuItem<FilterDropDown>> popubFilterType = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        filtterWidget: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            if (state.status == CubitStatus.succses &&
                state.newsList.isNotEmpty) {
              return FilterDropDownWidget(
                popubFilterType: popubFilterType,
                onSelected: (FilterDropDown result) {
                  // Handle menu item selection
                  context.read<NewsCubit>().newsSearchAndFilter(
                        isSearch: false,
                        searchQuery: result.filterName,
                        newsList: newsList,
                        reset: result.filterName == LocaleKeys.all.tr(),
                      );
                },
              );
            } else {
              return const SizedBox();
            }
          },
        ),
        title: LocaleKeys.nytNews.tr(),
        roundedBottomShape: true,
        isGridView: isGridView,
        centerTitle: false,
        onSearchSubmited: (searchQuery) {
          bool reset = searchQuery!.isEmpty;
          context.read<NewsCubit>().newsSearchAndFilter(
              isSearch: true,
              searchQuery: searchQuery,
              newsList: newsList,
              reset: reset);
          return null;
        },
        onChangedSearch: (searchQuery) {
          bool reset = searchQuery!.isEmpty;
          context.read<NewsCubit>().newsSearchAndFilter(
              isSearch: true,
              searchQuery: searchQuery,
              newsList: newsList,
              reset: reset);
          return null;
        },
        onPressedAction: () => switchListStyle(),
        onPressedFilterButton: () {},
      ),
      drawer: Drawer(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppWidthManger.w4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ToggleThemeButton(),
            SizedBox(
              height: AppHeightManger.h2,
            ),
            const ToggleLanguageButton()
          ],
        ),
      )),
      body: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {
          //Switch To Check Status
          switch (state.status) {
            //Show Note Snack Bar Message With Error To User
            case CubitStatus.error:
              {
                NoteMessage.showSnackBar(
                    context: context, text: state.errorMessage, warning: true);
              }
            //When Data Came Fill List Of News
            case CubitStatus.succses:
              {
                newsList = state.newsResponseEntite.results;
                //Fill Section List
                //Mapping It To Drop Down List And Add All Filter Type Also To Reset Filter
                if (state.sections.isNotEmpty) {
                  popubFilterType = state.sections.map(
                    (item) {
                      return PopupMenuItem<FilterDropDown>(
                        value:
                            FilterDropDown(filterName: item, isSelected: false),
                        child: AppTextWidget(
                          text: item,
                          fontSize: FontSizeManger.fs16,
                        ),
                      );
                    },
                  ).toList();
                  //Insert All Option First Item In List
                  popubFilterType.insert(
                    0,
                    PopupMenuItem<FilterDropDown>(
                      value: FilterDropDown(
                          filterName: LocaleKeys.all.tr(), isSelected: true),
                      child: AppTextWidget(
                        text: LocaleKeys.all.tr(),
                        fontSize: FontSizeManger.fs16,
                      ),
                    ),
                  );
                }
              }
              break;
            default:
          }
        },
        builder: (context, state) {
          switch (state.status) {
            //In Case Loading UI
            case CubitStatus.loading:
              {
                return isGridView
                    ? PaginationGridView(
                        scrollDirection: Axis.vertical,
                        itemCount: 10,
                        padding: EdgeInsets.symmetric(
                            horizontal: AppWidthManger.w2,
                            vertical: AppHeightManger.h2),
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) =>
                            const LoadingNewsGridItemWidget(),
                      )
                    : PaginationListView(
                        scrollDirection: Axis.vertical,
                        itemCount: 10,
                        padding: EdgeInsets.symmetric(
                            horizontal: AppWidthManger.w2,
                            vertical: AppHeightManger.h2),
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: AppHeightManger.h2,
                          );
                        },
                        itemBuilder: (context, index) =>
                            const LoadingNewsListItemWidget(),
                      );
              }
            //In Case Data Fetched UI
            case CubitStatus.succses:
              {
                final tempNews = state.newsList;
                //Handeling Empty Data
                if (tempNews.isEmpty) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: AppHeightManger.h10,
                        ),
                        LottieBuilder.asset(LottieManager.emptyDataLottie),
                        AppTextWidget(
                          text: '${LocaleKeys.noResultsFound.tr()} !',
                          fontSize: FontSizeManger.fs20,
                          fontWeight: FontWeightManger.semiBoldWeight,
                          color: AppColorManger.mainAppColor,
                        ),
                      ],
                    ),
                  );
                } else {
                  //Check List Style
                  return isGridView
                      ? RefreshIndicator(
                          onRefresh: () async {
                            context.read<NewsCubit>().getNewsData();
                          },
                          child: PaginationGridView(
                            itemBuilder: (context, index) {
                              final newsItem = tempNews[index];
                              return NewsGridItemWidget(
                                newsItem: newsItem,
                              );
                            },
                            itemCount: tempNews.length,
                            scrollDirection: Axis.vertical,
                            padding: EdgeInsets.symmetric(
                                horizontal: AppWidthManger.w2,
                                vertical: AppHeightManger.h2),
                          ),
                        )
                      : RefreshIndicator(
                          onRefresh: () async {
                            context.read<NewsCubit>().getNewsData();
                          },
                          child: PaginationListView(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppWidthManger.w2,
                                vertical: AppHeightManger.h2),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              final newsItem = tempNews[index];
                              return NewsListItemWidget(newsItem: newsItem);
                            },
                            itemCount: tempNews.length,
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: AppHeightManger.h2,
                              );
                            },
                          ),
                        );
                }
              }
            // In Case Error UI
            default:
              {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LottieBuilder.asset(
                      LottieManager.errorLottie,
                      width: AppWidthManger.w64,
                      height: AppWidthManger.w64,
                    ),
                    SizedBox(
                      height: AppHeightManger.h2,
                    ),
                    RefreshButton(
                      refreshTitle: state.errorMessage,
                      onTap: () => context.read<NewsCubit>().getNewsData(),
                    )
                  ],
                );
              }
          }
        },
      ),
    );
  }

  //!Functions
  //Function Switch List Style To Grid Or List
  void switchListStyle() {
    setState(
      () {
        isGridView = !isGridView;
      },
    );
  }
  //TODO:Stil Need Check Orientation Procsses Layouts
// new OrientationBuilder(
//   builder: (context, orientation) {
//     return new GridView.count(
//       // Create a grid with 2 columns in portrait mode, or 3 columns in
//       // landscape mode.
//       crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
//     );
//   },
// );
}
