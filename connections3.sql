drop database if exists vk;
create database if not exists vk;
use vk;

create table if not exists users(
id int primary key auto_increment,
username varchar(30),
password_hash varchar(300),
last_seen datetime
);

create table if not exists chats(
id int primary key auto_increment,
title varchar(50),
description varchar(200),
owner_id int,
foreign key (owner_id) references users(id)
);

create table if not exists users_to_chats(
users_id int,
chat_id int,
primary key (users_id, chat_id),
enter_datetime datetime,
foreign key (users_id) references users(id),
foreign key (chat_id) references chats(id)
);

insert into users(username) values
('user 1'),
('user 2'),
('user 3');

insert into chats(title, description, owner_id) values
('chat 1', 'for car lovers', 1),
('chat 2', 'anime is the best kino', 3),
('chat 3', '', 2);

insert into users_to_chats values
(1, 1, '2023-01-01 00:00:15'),
(1, 2, '2023-01-06 00:03:07'),
(1, 3, '2023-01-05 10:03:47'),
(2, 1, '2023-01-01 00:00:16'),
(2, 3, '2023-01-03 17:56:37'),
(3, 1, '2023-01-06 18:19:43'),
(3, 2, '2023-01-05 12:19:57');

select*from users;
select*from chats;
select*from users_to_chats;

-- выбрать название чата и описание для первого пользователя
-- отсортированы по названию чата в обратном порядке
select title, description from users_to_chats, chats
where users_to_chats.users_id = 1 and users_to_chats.chat_id = chats.id order by title desc;

-- выбрать название чата и описание для второго пользователя
-- отсортированы по названию чата в обратном порядке
select title, description from users_to_chats, chats
where users_to_chats.users_id = 2 and users_to_chats.chat_id = chats.id order by title desc;

-- выбрать название чата и описание для третьего пользователя
-- отсортированы по названию чата в обратном порядке
select title, description from users_to_chats, chats
where users_to_chats.users_id = 3 and users_to_chats.chat_id = chats.id order by title desc;

-- выбрать название чата и дату вступления в чат для первого пользователя
-- отсортированы по дате вступления в чат
select title, enter_datetime from users_to_chats, chats
where users_to_chats.users_id = 1 and users_to_chats.chat_id = chats.id order by enter_datetime;

-- выбрать название чата и дату вступления в чат для второго пользователя
-- отсортированы по дате вступления в чат
select title, enter_datetime from users_to_chats, chats
where users_to_chats.users_id = 2 and users_to_chats.chat_id = chats.id order by enter_datetime;

-- выбрать название чата и дату вступления в чат для третьего пользователя
-- отсортированы по дате вступления в чат
select title, enter_datetime from users_to_chats, chats
where users_to_chats.users_id = 3 and users_to_chats.chat_id = chats.id order by enter_datetime;

-- выбрать дату создания первого чата
select owner_id, title, enter_datetime from users_to_chats, chats
where chats.owner_id = 1 and users_to_chats.users_id = 1 and users_to_chats.chat_id = 1;

-- выбрать дату создания второго чата
select owner_id, title, enter_datetime from users_to_chats, chats
where chats.owner_id = 3 and users_to_chats.users_id = 3 and users_to_chats.chat_id = 2;

-- выбрать дату создания первого чата
select owner_id, title, enter_datetime from users_to_chats, chats
where chats.owner_id = 2 and users_to_chats.users_id = 2 and users_to_chats.chat_id = 3;