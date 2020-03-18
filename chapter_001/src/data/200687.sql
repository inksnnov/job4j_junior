create table role
(
    id        serial primary key,
    role_name varchar(50)
);

create table users
(
    id      serial primary key,
    name    varchar(50),
    email   varchar(50),
    role_id int references role (id)
);

create table rules
(
    id   serial primary key,
    rule varchar(50)
);

create table role_config
(
    role_id int references role (id),
    rule_id int references rules (id)
);

create table category
(
    id   serial primary key,
    name varchar(50)
);

create table state
(
    id   serial primary key,
    name varchar(50)
);

create table item
(
    id          serial primary key,
    title       varchar(100),
    user_id     int references users (id),
    category_id int references category (id),
    state_id    int references state (id)
);

create table comments
(
    id      serial primary key,
    comment text,
    item_id int references item (id)
);

create table attach
(
    id      serial primary key,
    path    varchar(500),
    item_id int references item (id)
);

insert into role (role_name)
values ('Администратор');

insert into role (role_name)
values ('Модератор');

insert into role (role_name)
values ('Пользователь');

insert into rules(rule)
values ('Создать');

insert into rules(rule)
values ('Редактировать');

insert into rules(rule)
values ('Удалить');

insert into role_config(role_id, rule_id)
values (1, 1);

insert into role_config(role_id, rule_id)
values (1, 2);

insert into role_config(role_id, rule_id)
values (1, 3);

insert into role_config(role_id, rule_id)
values (2, 2);

insert into role_config(role_id, rule_id)
values (2, 3);

insert into role_config(role_id, rule_id)
values (3, 1);

insert into role_config(role_id, rule_id)
values (3, 2);

insert into state(name)
values ('Не отвечено');

insert into state(name)
values ('Отвечено');

insert into state(name)
values ('Закрыто');

insert into category(name)
values ('Проблемы с оборудованием');

insert into category(name)
values ('Проблемы с программой');

insert into category(name)
values ('Другой вопрос');