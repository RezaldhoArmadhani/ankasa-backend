-- CREATE DATABASE

create database ankasa;
\l
\c ankasa

-- CREATE TABLE

create table users(
    id varchar(36) not null primary key,
    fullname varchar(40) not null,
    email varchar(60) not null unique,
    password varchar(128) not null,
    image varchar default('user.png'),
    phone_number varchar(16),
    city varchar(40),
    address varchar(60),
    zipcode varchar(6)
);

create table admin(
    id varchar(36) not null primary key,
    email varchar(60) not null unique,
    password varchar(128) not null
);

create table credit_card(
    id varchar(36) not null primary key,
    id_user varchar(36) references users on update cascade on delete cascade,
    foreign key (id_user) references users(id),
    fullname varchar(40) not null,
    credit_number int not null,
    expire date not null,
    cvv int not null,
    balance numeric not null
);

create table chat(
    id varchar(36) not null primary key,
    sender varchar(36) references users on update cascade on delete cascade,
    foreign key (sender) references users(id),
    receiver varchar(36) references admin on update cascade on delete cascade,
    foreign key (receiver) references admin(id),
    message text,
    date_time date
);

create table city(
    id varchar(36) not null primary key,
    name varchar(20) not null,
    country varchar(20) not null,
    image varchar default('city.png')
);