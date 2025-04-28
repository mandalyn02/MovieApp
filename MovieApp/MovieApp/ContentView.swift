import SwiftUI

// MARK: - Models

struct Movie: Identifiable {
    let id = UUID()
    let title: String
    let genre: String
    let rating: Double
    let posterURL: String
    let isTrending: Bool
    let review: String
}

struct UserReview: Identifiable {
    let id = UUID()
    let userName: String
    let userAvatarURL: String
    let movie: Movie
}
struct Review: Identifiable {
    let id = UUID()
    let reviewerName: String
    let profileImageURL: String
    let movie: Movie
    let comment: String
}
let sampleReviews: [Review] = [
    Review(
        reviewerName: "Alex Johnson",
        profileImageURL: "https://randomuser.me/api/portraits/men/32.jpg",
        movie: sampleMovies[0],
        comment: "Absolutely stunning visuals! Dune blew my mind. 🔥"
    ),
    Review(
        reviewerName: "Emily Smith",
        profileImageURL: "https://randomuser.me/api/portraits/women/44.jpg",
        movie: sampleMovies[1],
        comment: "Barbie was way deeper and more clever than I expected. Loved it!"
    ),
    Review(
        reviewerName: "Michael Lee",
        profileImageURL: "https://randomuser.me/api/portraits/men/65.jpg",
        movie: sampleMovies[2],
        comment: "Oppenheimer is intense. Nolan never disappoints!"
    ),
    Review(
        reviewerName: "Sophia Chen",
        profileImageURL: "https://randomuser.me/api/portraits/women/28.jpg",
        movie: sampleMovies[3],
        comment: "Batman is back and darker than ever. Amazing soundtrack too!"
    ),
    Review(
        reviewerName: "Daniel Kim",
        profileImageURL: "https://randomuser.me/api/portraits/men/52.jpg",
        movie: sampleMovies[4],
        comment: "Guardians Vol.3 made me laugh and cry. Rocket's story 💔."
    )
]

// MARK: - Sample Data

// Community trending movies
let sampleMovies: [Movie] = [
    Movie(
        title: "Dune",
        genre: "Sci-Fi",
        rating: 8.2,
        posterURL: "https://image.tmdb.org/t/p/w500/d5NXSklXo0qyIYkgV94XAgMIckC.jpg",
        isTrending: true,
        review: "A stunning sci-fi epic with immersive world-building and gripping performances."
    ),
    Movie(
        title: "Barbie",
        genre: "Comedy",
        rating: 7.9,
        posterURL: "https://image.tmdb.org/t/p/w500/iuFNMS8U5cb6xfzi51Dbkovj7vM.jpg",
        isTrending: true,
        review: "A surprisingly witty and thoughtful film that blends humor with social commentary."
    ),
 
    Movie(
        title: "The Batman",
        genre: "Action/Crime",
        rating: 7.9,
        posterURL: "https://image.tmdb.org/t/p/w500/74xTEgt7R36Fpooo50r9T25onhq.jpg",
        isTrending: true,
        review: "A gritty and intense take on Gotham's Dark Knight."
    ),
    Movie(
        title: "Guardians of the Galaxy Vol. 3",
        genre: "Action/Sci-Fi",
        rating: 8.1,
        posterURL: "https://image.tmdb.org/t/p/w500/r2J02Z2OpNTctfOSN1Ydgii51I3.jpg",
        isTrending: true,
        review: "An emotional, hilarious and action-packed farewell to the beloved team."
    ),
    Movie(
        title: "Avatar: The Way of Water",
        genre: "Fantasy/Sci-Fi",
        rating: 7.7,
        posterURL: "https://image.tmdb.org/t/p/w500/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg",
        isTrending: true,
        review: "Visually breathtaking and a worthy return to Pandora."
    ),
    Movie(
        title: "John Wick: Chapter 4",
        genre: "Action/Thriller",
        rating: 8.0,
        posterURL: "https://image.tmdb.org/t/p/w500/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg",
        isTrending: true,
        review: "Relentless action and stunning visuals. Wick delivers again!"
    )
]


// Community user reviews
let userReviews: [UserReview] = [
    UserReview(
        userName: "MovieBuff23",
        userAvatarURL: "https://randomuser.me/api/portraits/men/32.jpg",
        movie: sampleMovies[0]
    ),
    UserReview(
        userName: "CinemaQueen",
        userAvatarURL: "https://randomuser.me/api/portraits/women/44.jpg",
        movie: sampleMovies[1]
    ),
    UserReview(
        userName: "IndieFanatic",
        userAvatarURL: "https://randomuser.me/api/portraits/men/76.jpg",
        movie: sampleMovies[2]
    )
]

// User's personal reviews (for profile)
let myMovies: [Movie] = [
    Movie(
        title: "Everything Everywhere All At Once",
        genre: "Adventure",
        rating: 8.5,
        posterURL: "https://image.tmdb.org/t/p/w500/w3LxiVYdWWRvEVdn5RYq6jIqkb1.jpg",
        isTrending: false,
        review: "A mind-bending, heartfelt story about multiverses and family. Absolutely unique!"
    ),
    Movie(
        title: "Guardians of the Galaxy Vol. 3",
        genre: "Action/Sci-Fi",
        rating: 8.1,
        posterURL: "https://image.tmdb.org/t/p/w500/r2J02Z2OpNTctfOSN1Ydgii51I3.jpg",  // Updated URL
        isTrending: false,
        review: "A fantastic conclusion to the trilogy! Emotional, hilarious, and a visual feast."
    )

,
    Movie(
        title: "Spider-Man: Across the Spider-Verse",
        genre: "Animation",
        rating: 8.9,
        posterURL: "https://image.tmdb.org/t/p/w500/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg",
        isTrending: false,
        review: "Visually groundbreaking and emotionally resonant. Miles Morales shines again."
    )
]

// MARK: - Views
struct AppHeader: View {
    var body: some View {
        HStack {
            // Logo or App Name
            Text("MovieApp") // Replace with an image if you have a logo
                .font(.title2)
                .bold()
                .foregroundColor(.purple)
                .padding()
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white) // White background for the header
        .shadow(radius: 4) // Optional shadow for the header
    }
}

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TrendingView()
                .tabItem {
                    Label("Trending", systemImage: "flame.fill")
                }
            ReviewListView()
                .tabItem {
                    Label("Reviews", systemImage: "star.bubble.fill")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle.fill")
                }
        }
        .accentColor(Color.purple)
        .overlay(
            VStack {
                HStack {
                    Text("CineCritic")
                        .font(.title2) // Smaller font size
                        .fontWeight(.bold)
                        .foregroundColor(.purple)
                        .padding(.top, 5) // Adjusted padding
                        .padding(.leading, 15) // Adjusted padding
                    Spacer()
                }
                Spacer()
            }
            , alignment: .top
        )
    }
}

struct TrendingView: View {
    var body: some View {
        NavigationView {
            List(sampleMovies.filter { $0.isTrending }) { movie in
                MovieRow(movie: movie)
            }
            .navigationTitle("Trending Movies") // Smaller page title
            .font(.title3) // Adjusted font size for page title
        }
    }
}

struct MovieRow: View {
    let movie: Movie

    var body: some View {
        HStack(spacing: 16) {
            AsyncImage(url: URL(string: movie.posterURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Rectangle()
                    .foregroundColor(.gray.opacity(0.3))
                    .overlay(ProgressView())
            }
            .frame(width: 60, height: 90)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 4)

            VStack(alignment: .leading, spacing: 6) {
                Text(movie.title)
                    .font(.headline)
                Text(movie.genre)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.caption)
                    Text(String(format: "%.1f", movie.rating))
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(.vertical, 8)
    }
}

struct ReviewListView: View {
    var body: some View {
        NavigationView {
            List(sampleReviews) { review in
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        AsyncImage(url: URL(string: review.profileImageURL)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            Color.gray.opacity(0.3)
                        }
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .shadow(radius: 2)

                        VStack(alignment: .leading) {
                            Text(review.reviewerName)
                                .font(.subheadline)
                                .bold()
                                .foregroundColor(Color.primary)
                            Text("Posted a review")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }

                        Spacer()

                        Button(action: {
                            // Follow action
                        }) {
                            Text("Follow")
                                .font(.caption)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(Color.purple.opacity(0.1))
                                .cornerRadius(12)
                        }
                    }

                    HStack(spacing: 12) {
                        AsyncImage(url: URL(string: review.movie.posterURL)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            Color.gray.opacity(0.3)
                        }
                        .frame(width: 60, height: 90)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(radius: 2)

                        VStack(alignment: .leading, spacing: 4) {
                            Text(review.movie.title)
                                .font(.headline)
                                .foregroundColor(Color.pink)
                            Text(review.movie.genre)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }

                    Text(review.comment)
                        .font(.body)
                        .foregroundColor(.primary)
                        .padding(.vertical, 4)

                    HStack(spacing: 24) {
                        Button(action: {
                            // Like action
                        }) {
                            Label("Like", systemImage: "heart")
                                .font(.caption)
                                .foregroundColor(.teal)
                        }

                        Button(action: {
                            // Comment action
                        }) {
                            Label("Comment", systemImage: "bubble.right")
                                .font(.caption)
                                .foregroundColor(.teal)
                        }

                        Button(action: {
                            // Share action
                        }) {
                            Label("Share", systemImage: "square.and.arrow.up")
                                .font(.caption)
                                .foregroundColor(.teal)
                        }
                    }
                    .padding(.top, 4)
                    .foregroundColor(.gray)

                    Divider()
                }
                .padding(.vertical, 8)
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Movie Reviews")
        }
    }
}

struct ProfileView: View {
    let numberOfReviews = 58
    let numberOfFollowers = 120
    let numberOfFollowing = 75

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    AsyncImage(url: URL(string: "https://randomuser.me/api/portraits/men/18.jpg")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Circle()
                            .foregroundColor(.gray.opacity(0.3))
                            .overlay(ProgressView())
                    }
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .shadow(radius: 5)
                    .padding(.top, 20)

                    Text("CinemaKing")
                        .font(.title2)
                        .bold()

                    Text("Always chasing good stories")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    HStack(spacing: 30) {
                        VStack {
                            Text("\(numberOfReviews)")
                                .font(.headline)
                            Text("Reviews")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        VStack {
                            Text("\(numberOfFollowers)")
                                .font(.headline)
                            Text("Followers")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        VStack {
                            Text("\(numberOfFollowing)")
                                .font(.headline)
                            Text("Following")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.top, 10)

                    Button(action: {
                        // Handle edit profile action
                    }) {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }

                    Divider()
                        .padding(.vertical, 20)

                    VStack(alignment: .leading, spacing: 12) {
                        Text("Your Reviews")
                            .font(.headline)
                            .padding(.horizontal)

                        ForEach(myMovies) { movie in
                            HStack(spacing: 12) {
                                AsyncImage(url: URL(string: movie.posterURL)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                } placeholder: {
                                    Rectangle()
                                        .foregroundColor(.gray.opacity(0.3))
                                        .overlay(ProgressView())
                                }
                                .frame(width: 50, height: 75)
                                .clipShape(RoundedRectangle(cornerRadius: 8))

                                VStack(alignment: .leading, spacing: 4) {
                                    Text(movie.title)
                                        .font(.subheadline)
                                        .bold()
                                    Text(movie.review.prefix(60) + "...")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.bottom, 30)
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ContentView()
}
