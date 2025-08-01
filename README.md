# IMDb SQL Project
# 📚 Project Description
This project involves solving a comprehensive set of SQL queries on an IMDb movie dataset. It covers: 1.Basic Joins 2.Inner Joins 3.Left Joins 4.Right Joins 5.Complex Joins (Multiple Joins) 6..Partition By and Window Functions

The goal is to practice and demonstrate SQL skills using real-world movie data.

# 📂 Dataset Description
The dataset includes the following tables (provided separately as CSV files):

movie: Information about movies (title, production company, country, duration, year, etc.)

genre: Movie genres mapped to movies

director_mapping: Mapping of directors to movies

role_mapping: Mapping of actors and other roles to movies

names: Names of people involved (directors, actors, writers)

ratings: IMDb ratings and total votes for each movie

# 🛢️ Database Schema and Relationships
The IMDb database is structured with six main tables. Here’s how they are connected:

Table: movie Primary Key: id Columns: id, title, date_published, duration, country, worlwide_gross_income, production_company, etc.
Description: Stores all movie-related information.

Table: names Primary Key: id Columns: id, name
Description: Stores names of individuals (actors, directors, writers).

Table: director_mapping Composite Key: (movie_id, name_id) Columns: movie_id (FK), name_id (FK)
Foreign Keys: movie_id → movie.id name_id → names.id

Description: Maps directors to the movies they directed.

Table: role_mapping Composite Key: (movie_id, name_id, category) Columns: movie_id (FK), name_id (FK), category
Foreign Keys: movie_id → movie.id name_id → names.id

Description: Maps actors (and other roles) to movies. (Category defines if it's an 'actor', 'actress', etc.)

Table: genre Primary Key: Auto-increment or Composite Key (movie_id, genre) Columns: movie_id (FK), genre
Foreign Key: movie_id → movie.id Description: Lists genres associated with each movie.

Table: ratings Primary Key: movie_id Columns: movie_id (FK), avg_rating, total_votes
Foreign Key: movie_id → movie.id

Description: Stores IMDb rating and votes for each movie.

# 📄 SQL Query Sections
--Basic Joins 1.Retrieve all movies along with their directors 2.Get all movies and their genres 3.List all actors along with the movies they have acted in 4.Get all movies and their corresponding writers 5.Retrieve all users who have rated movies along with the rating they provided

--Inner Joins 1.Find names of actors who have acted in at least one movie 2.List directors who have directed more than 5 movies 3.Retrieve movies that have at least one review 4.List movies along with production company names 5.Fetch movies with their country of origin

--Left Joins 1.List all movies, even those without ratings 2.Retrieve all actors, even those who have not acted in any movie 3.Get all directors, including those who haven't directed any movies

--Right Joins 1.Find all movies and ensure genres are included even if no movies belong to that genre 2.Get all movies and ensure all countries are listed even if no movie was produced there 3.Retrieve all writers and ensure that movies written by them are included 4.List all reviews and the movies they belong to

--Complex Joins 1.Retrieve top 5 highest-rated movies along with their directors and genres 2.Find actors who have worked with the same director in at least 3 movies 3.List all directors and the actors they have worked with 4.Retrieve all movies with their genres and directors in one query

--Partition By and Window Function Queries 1.Retrieve top 5 highest-rated movies per genre using RANK() 2.Find cumulative revenue ordered by release date using SUM() OVER() 3.Get previous movie rating using LAG() 4.Get next movie rating using LEAD() 5.Retrieve average movie rating per genre 6.Rank movies within each genre using DENSE_RANK() 7.Find running total of box office earnings for movies after 2000 8.Find first and last movie released for each director 9.Compute difference in box office earnings between consecutive movies 10.Find total number of movies each actor has acted in

# 🛠️ Tools Used
SQL (MySQL, PostgreSQL, or any RDBMS) IMDb Dataset (CSV files)

# 📋 How to Run
1.Import all CSV files into your SQL database. 2.Create respective tables (movie, genre, names, director_mapping, role_mapping, ratings). 3.Execute the SQL queries provided in the project. 4.Analyze the results for insights.

# 📌 Notes
1.Right join queries assume movie attributes (like genre, country) might exist independently. 2.Window functions are used for advanced analysis (rankings, running totals, comparisons). 3.Some simplifications are made for project practice purposes
