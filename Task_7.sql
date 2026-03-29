create database IMDB;
use IMDB;

create table movies(movie_id int primary key, title text, release_year int, duration int);
insert into movies values(001, 'Home Alone', 2000, 2);
insert into movies values(002, 'Conjuring', 2025, 1);
insert into movies values(003, 'Inception', 2015, 2);
select * from movies;

create table media(media_id int primary key, movie_id int, foreign key(movie_id) references movies(movie_id), media_type text);
insert into media values(001, 001, 'Video');
insert into media values(002, 001, 'Image');
insert into media values(003, 001, 'Video');
select * from media;

create table genre(genre_id int primary key, genre_name text);
insert into genre values(001, 'Horror');
insert into genre values(002, 'Comedy');
insert into genre values(003, 'Thriller');
select * from genre;

create table movie_genre(movie_id int, foreign key (movie_id) references movies(movie_id), genre_id int , foreign key (genre_id) references genre(genre_id));
insert into movie_genre values(001,002);
insert into movie_genre values(002,001);
insert into movie_genre values(003,003);
select * from movie_genre;

create table viewer(user_id int primary key, username text, email text);
insert into viewer values(1001, 'Ajay', 'ajay@gmail.com');
insert into viewer values(1002, 'Vijay', 'vijay@gmail.com');
insert into viewer values(1003, 'Arun', 'arun@gmail.com');
insert into viewer values(1004, 'Tharun', 'tharun@gmail.com');
select * from viewer;

create table review(review_id int primary key, movie_id int, foreign key (movie_id) references movies(movie_id), user_id int, foreign key (user_id) references viewer(user_id), rating int , review text);
insert into review values(001,001,1001,4,'Good Film');
insert into review values(002,001,1002,4,'Kids must watch');
insert into review values(003,002,1003,5,'very scary');
insert into review values(004,002,1004,1,'Not worth');
insert into review values(005,003,1003,5,'very good');
insert into review values(006,003,1001,3,'good to watch');
select * from review;

create table artist(artist_id int primary key, artist_name text);
insert into artist values(001, 'Raj');
insert into artist values(002, 'Kiran');
insert into artist values(003,'Simon');
insert into artist values(004, 'Rach');
select * from artist;

create table skill(skill_id int primary key, skill_name text);
insert into skill values(001, 'direct');
insert into skill values(002, 'act, dance');
insert into skill values(003, 'dance,sing');
insert into skill values(004, 'dance,act,sing');
select * from skill;

create table artist_skill(artist_id int , foreign key (artist_id) references artist(artist_id), skill_id int , foreign key (skill_id) references skill(skill_id));
insert into artist_skill values(001, 001);
insert into artist_skill values(002, 003);
insert into artist_skill values(003, 002);
insert into artist_skill values(004, 004);
select * from artist_skill;

create table roles(role_id int primary key, role_name text);
insert into roles values(001, 'Director');
insert into roles values(002, 'Hero');
insert into roles values(003, 'Heroine');
insert into roles values(004, 'background actor');
select * from roles;

create table movies_roles(movie_id int, foreign key (movie_id) references movies(movie_id), artist_id int , foreign key (artist_id) references artist(artist_id) , role_id int , foreign key (role_id) references roles(role_id));
insert into movies_roles values(001,001,001);
insert into movies_roles values(001,001,002);
insert into movies_roles values(002,004,003);
insert into movies_roles values(003,002,004);
insert into movies_roles values(004,003,001);
select * from movies_roles;


