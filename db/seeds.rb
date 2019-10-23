# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


List.create(name: 'First Movie List')

Movie.create(title: 'Star Wars Episode 1', year: '2008', imdb_id: '12345', rating: 4);
Movie.create(title: 'Star Wars Episode 2', year: '2008', imdb_id: '12346', rating: 5);
Movie.create(title: 'Star Wars Episode 3', year: '2008', imdb_id: '12347', rating: 5);
Movie.create(title: 'Star Wars Episode 4', year: '2008', imdb_id: '12348');
Movie.create(title: 'Star Wars Episode 5', year: '2008', imdb_id: '12349');

l = List.create(name: 'Star Wars')
l.movies << Movie.all


Movie.create(title: 'Iron Man', year: '2008', imdb_id: '12349');
Movie.create(title: 'Iron Man 2', year: '2008', imdb_id: '12349');
Movie.create(title: 'Iron Man 3', year: '2008', imdb_id: '12349');

b = List.create(name: 'Marvel');
newMovie = Movie.create(title: 'Test Marvel Movie', imdb_id: '38744')
b.movies << newMovie;
b.movies << Movie.first;
b.movies.delete(newMovie);


