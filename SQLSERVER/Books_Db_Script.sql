use librarydb

select * from Books 

create table Author
(
AuthorId int identity primary key,
AuthorName varchar(50) not null
)

create table Publisher
(
PublisherId int identity primary key,
PublisherName varchar(50) not null
)

create table BookCategory
(
CategoryId int identity primary key,
CategoryName varchar(50) not null
)

create table BookLanguage
(
LanguageId int identity primary key,
LanguageName varchar(50) not null
)