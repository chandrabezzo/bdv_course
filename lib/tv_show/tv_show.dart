class TvShowResponse {
    TvShowResponse({
        this.page,
        this.totalResults,
        this.totalPages,
        this.results,
    });

    int page;
    int totalResults;
    int totalPages;
    List<Result> results;

    factory TvShowResponse.fromJson(Map<String, dynamic> json) => TvShowResponse(
        page: json["page"],
        totalResults: json["total_results"],
        totalPages: json["total_pages"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "total_results": totalResults,
        "total_pages": totalPages,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        this.originalName,
        this.genreIds,
        this.name,
        this.popularity,
        this.originCountry,
        this.voteCount,
        this.firstAirDate,
        this.backdropPath,
        this.originalLanguage,
        this.id,
        this.voteAverage,
        this.overview,
        this.posterPath,
    });

    String originalName;
    List<int> genreIds;
    String name;
    double popularity;
    List<String> originCountry;
    int voteCount;
    DateTime firstAirDate;
    String backdropPath;
    String originalLanguage;
    int id;
    double voteAverage;
    String overview;
    String posterPath;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        originalName: json["original_name"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        name: json["name"],
        popularity: json["popularity"].toDouble(),
        originCountry: List<String>.from(json["origin_country"].map((x) => x)),
        voteCount: json["vote_count"],
        firstAirDate: DateTime.parse(json["first_air_date"]),
        backdropPath: json["backdrop_path"],
        originalLanguage: json["original_language"],
        id: json["id"],
        voteAverage: json["vote_average"].toDouble(),
        overview: json["overview"],
        posterPath: json["poster_path"],
    );

    Map<String, dynamic> toJson() => {
        "original_name": originalName,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "name": name,
        "popularity": popularity,
        "origin_country": List<dynamic>.from(originCountry.map((x) => x)),
        "vote_count": voteCount,
        "first_air_date": "${firstAirDate.year.toString().padLeft(4, '0')}-${firstAirDate.month.toString().padLeft(2, '0')}-${firstAirDate.day.toString().padLeft(2, '0')}",
        "backdrop_path": backdropPath,
        "original_language": originalLanguage,
        "id": id,
        "vote_average": voteAverage,
        "overview": overview,
        "poster_path": posterPath,
    };
}

class SearchTvShowResponse {
    SearchTvShowResponse({
        this.page,
        this.totalResults,
        this.totalPages,
        this.results,
    });

    int page;
    int totalResults;
    int totalPages;
    List<ResultSearch> results;

    factory SearchTvShowResponse.fromJson(Map<String, dynamic> json) => SearchTvShowResponse(
        page: json["page"],
        totalResults: json["total_results"],
        totalPages: json["total_pages"],
        results: List<ResultSearch>.from(json["results"].map((x) => ResultSearch.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "total_results": totalResults,
        "total_pages": totalPages,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class ResultSearch {
    ResultSearch({
        this.originalName,
        this.genreIds,
        this.name,
        this.popularity,
        this.originCountry,
        this.voteCount,
        this.firstAirDate,
        this.backdropPath,
        this.originalLanguage,
        this.id,
        this.voteAverage,
        this.overview,
        this.posterPath,
    });

    String originalName;
    List<int> genreIds;
    String name;
    double popularity;
    List<String> originCountry;
    int voteCount;
    DateTime firstAirDate;
    String backdropPath;
    String originalLanguage;
    int id;
    double voteAverage;
    String overview;
    String posterPath;

    factory ResultSearch.fromJson(Map<String, dynamic> json) => ResultSearch(
        originalName: json["original_name"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        name: json["name"],
        popularity: json["popularity"].toDouble(),
        originCountry: List<String>.from(json["origin_country"].map((x) => x)),
        voteCount: json["vote_count"],
        firstAirDate: DateTime.parse(json["first_air_date"]),
        backdropPath: json["backdrop_path"],
        originalLanguage: json["original_language"],
        id: json["id"],
        voteAverage: json["vote_average"].toDouble(),
        overview: json["overview"],
        posterPath: json["poster_path"],
    );

    Map<String, dynamic> toJson() => {
        "original_name": originalName,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "name": name,
        "popularity": popularity,
        "origin_country": List<dynamic>.from(originCountry.map((x) => x)),
        "vote_count": voteCount,
        "first_air_date": "${firstAirDate.year.toString().padLeft(4, '0')}-${firstAirDate.month.toString().padLeft(2, '0')}-${firstAirDate.day.toString().padLeft(2, '0')}",
        "backdrop_path": backdropPath,
        "original_language": originalLanguage,
        "id": id,
        "vote_average": voteAverage,
        "overview": overview,
        "poster_path": posterPath,
    };
}