//IMPORT EXTERN APP
import 'package:flutter/material.dart';

//IMPORT LOCAL APP
import 'package:app/styles/dana_theme.dart';

class NoFavouritesContentWidget extends StatelessWidget {
  const NoFavouritesContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(35),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(150),
              border: Border.all(color: DanaTheme.paletteDarkBlue, width: 1.8),
            ),
            child: Icon(
              Icons.bookmark_outline_outlined,
              color: DanaTheme.paletteDarkBlue,
              size: 40,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Text(
              '¡No hay favoritos!',
              style:
                  DanaTheme.title2.copyWith(color: DanaTheme.paletteDarkBlue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'Haz click en el icono y guárdate tus programas favoritos!',
              textAlign: TextAlign.center,
              style:
                  DanaTheme.title2.copyWith(color: DanaTheme.paletteDarkBlue),
            ),
          ),
        ],
      ),
    );
  }
}
