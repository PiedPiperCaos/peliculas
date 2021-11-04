import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:peliculas/models/movie.dart';

class MovieSlider extends StatefulWidget {
  const MovieSlider({
    Key? key,
    this.title,
    required this.movies,
    required this.onNextPage,
  }) : super(key: key);

  final String? title;
  final List<Movie> movies;
  final Function onNextPage;

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        widget.onNextPage();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (this.widget.title != null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.title!,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          SizedBox(
            height: 5.0,
          ),
          Expanded(
              child: ListView.builder(
                  controller: scrollController,
                  itemCount: widget.movies.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, int index) {
                    return _MoviePoster(widget.movies[index]);
                  }))
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  _MoviePoster(Movie this.movie);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 200,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
              onTap: () => Navigator.pushNamed(context, "details",
                  arguments: "movie-instance"),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: FadeInImage(
                      fit: BoxFit.cover,
                      placeholder: AssetImage("assets/no-image.jpg"),
                      image: NetworkImage(movie.fullPosterImage)))),
          SizedBox(
            height: 5.0,
          ),
          Text(
            movie.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
