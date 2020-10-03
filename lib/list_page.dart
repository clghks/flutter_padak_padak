import 'package:flutter/material.dart';
import 'model/dummys_repository.dart';
import 'model/movies_response.dart';

class ListPage extends StatelessWidget {
  final List<Movie> movies = DummysResponsitory.loadDummyMovies();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return _buildDummyItem(movies[index]);
        },
        separatorBuilder: (_, index) => Divider(color: Colors.grey),
        itemCount: movies.length);
  }

  _buildDummyItem(Movie movie) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(movie.thumb, height: 120),
          Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(movie.title,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(width: 8),
                      _buildGradeImage(movie.grade)
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text('평점 : ${movie.userRating / 2}'),
                      SizedBox(width: 10),
                      Text('예메순위 : ${movie.reservationGrade}'),
                      SizedBox(width: 10),
                      Text('예매율 : ${movie.reservationRate}'),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text('개봉일 : ${movie.date}')
                ],
              ))
        ],
      ),
    );
  }

  Widget _buildGradeImage(int grade) {
    switch (grade) {
      case 0:
        return Image.asset("assets/ic_allages.png");
      case 12:
        return Image.asset("assets/ic_12.png");
      case 15:
        return Image.asset("assets/ic_15.png");
      case 19:
        return Image.asset("assets/ic_19.png");
      default:
        return null;
    }
  }
}
