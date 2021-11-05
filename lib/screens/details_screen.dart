import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    print(movie);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(movie: movie),
              _Overview(movie: movie),
              CastingCards()
            ]),
          ),

          //SliverFillRemaining(),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          padding: EdgeInsets.only(bottom: 10),
          alignment: Alignment.bottomCenter,
          color: Colors.black45,
          width: double.infinity,
          child: Text("movie.title",
              style: TextStyle(fontSize: 16, color: Colors.red)),
        ),
        background: FadeInImage(
          placeholder: AssetImage("assets/loading.gif"),
          image: NetworkImage("https://via.placeholder.com/400x300"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Movie movie;

  const _PosterAndTitle({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
                fit: BoxFit.cover,
                height: 150,
                placeholder: AssetImage("assets/no-image.jpg"),
                image: NetworkImage("https://via.placeholder.com/200x300")),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "movie.title",
                style: textTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text("movie.originalTitle",
                  style: textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2),
              Row(
                children: [
                  Icon(
                    Icons.star_outline,
                    size: 15,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 5),
                  Text("movie.voteAverage",
                      style: textTheme.caption,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final Movie movie;

  const _Overview({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Text(
          "Esse minim veniam ex elit cillum. Ipsum enim occaecat excepteur Excepteur irure fugiat esse enim incididunt ipsum elit incididunt do. Voluptate incididunt ullamco cillum cupidatat est in enim duis amet ullamco ea culpa in pariatur. Exercitation labore esse ut duis magna cupidatat cupidatat consectetur duis nisi deserunt pariatur nulla adipisicing. Magna fugiat et amet ea ad. Id esse mollit eiusmod tempor qui irure velit veniam magna eaLabore non commodo magna laborum est laborum veniam nulla dolore ut magna dolor laborum. Sit commodo minim deserunt tempor adipisicing aliqua velit tempor amet Lorem. Ex non nisi in enim tempor labore reprehenderit minim in. Ex ad pariatur ex do commodo voluptate laboris occaecat est nisi minim id incididunt.Et minim eiusmod Lorem aliquip proident sunt aliqua ea anim. Ut enim ut consequat minim. Aliquip laboris magna enim ut. Sit duis fugiat consequat do qui qui fugiat culpa. Laborum labore labore non ipsum enim deserunt reprehenderit. Lorem laborum aute laboris magna. Duis officia excepteur consectetur est velit amet laboris tempor Excepteur pariatur magna excepteur id dolor culpa et elit minim voluptate cillum elit. Cillum nulla sunt aute nostrud pariatur irure in eiusmod anim commodo irure amet.. Culpa aute sit commodo occaecat elit ad nostrud sit ut mollit ea incididunt.",
          style: Theme.of(context).textTheme.subtitle1,
          textAlign: TextAlign.justify,
        ));
  }
}
