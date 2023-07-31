//IMPORT EXTERN APP
import 'package:app/core/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//IMPORT LOCAL APP
import 'package:app/cubits/publications/publications_cubit.dart';
import 'package:app/cubits/publications_saved/publications_saved_state.dart';
import 'package:app/features/user/app/cubits/initial_profile_cubit.dart';
import 'package:app/cubits/publications_saved/publications_saved_cubit.dart';
import 'package:app/core/enums/status_cubit.dart';
import 'package:app/models/publication_model.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/widgets/shared/social_app_bar.dart';
import 'package:app/widgets/social/social_publication_widget.dart';

class SocialBookmarkPage extends StatefulWidget {
  SocialBookmarkPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SocialBookmarkPage> createState() => _SocialBookmarkPageState();
}

class _SocialBookmarkPageState extends State<SocialBookmarkPage> {
  Publication? _publication;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      this._getPublications();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DanaTheme.paletteWhite,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Column(
                children: [
                  SizedBox(
                    height: 155,
                  ),
                  _buildMainContent(),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Container(
                height: 50,
                color: DanaTheme.bgAppbar,
              ),
              SocialAppBar(
                title: 'Publicaciones guardadas',
                bgColor: DanaTheme.bgAppbar,
                showBackButton: true,
                showLogo: false,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return BlocProvider<PublicationsSavedCubit>(
      create: (context) => PublicationsSavedCubit(
        userId: locator<InitialProfileCubit>().state.id,
      ),
      child: BlocBuilder<PublicationsSavedCubit, PublicationsSavedState>(
        builder: (context, state) {
          if (state.status == StatusCubit.SUCCESS) {
            final _publications = state.publications!
                .where((element) => element.bookmarkedBy!
                    .contains(locator<InitialProfileCubit>().state.id))
                .toList();
            return ListView.builder(
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _publications.length,
              itemBuilder: (_, index) {
                _publication = _publications[index];
                if (!_publication!
                    .isBookmarked(locator<InitialProfileCubit>().state.id)) {
                  return Container();
                }

                return SocialPublicationWidget(
                  publication: _publication!,
                  refreshFn: () => setState(() {}),
                );
              },
            );
          }
          if (state.status == StatusCubit.LOADING) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: DanaTheme.paletteDanaPink,
                color: DanaTheme.paletteFPink,
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Future<void> _getPublications() async {
    PublicationsCubit cubit = BlocProvider.of<PublicationsCubit>(context);
    cubit.getPublications(null, null, false);
  }
}
