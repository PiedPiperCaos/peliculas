import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/models/movie.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({Key? key, required this.movies}) : super(key: key);
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (this.movies.length == 0) {
      return Container(
          width: double.infinity,
          height: size.height / 2,
          child: Center(
            child: CircularProgressIndicator(),
          ));
    }

    return Container(
      width: double.infinity,
      height: size.height / 2,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: (_, int index) {
          final movie = movies[index];

          return GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, "details", arguments: movie),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(movie.fullPosterImage),
                  fit: BoxFit.cover,
                ),
              ));
        },
      ),
    );
  }
}
