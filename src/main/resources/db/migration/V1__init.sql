create table users
(
    id       bigserial,
    username varchar(30) not null unique,
    password varchar(80) not null,
    email    varchar(50) unique,
    primary key (id)
);

create table roles
(
    id   serial,
    name varchar(50) not null,
    primary key (id)
);


create table privileges
(
    id   serial,
    name varchar(50) not null,
    primary key (id)
);

CREATE TABLE users_roles
(
    user_id bigint not null,
    role_id int    not null,
    primary key (user_id, role_id),
    foreign key (user_id) references users (id),
    foreign key (role_id) references roles (id)
);

CREATE TABLE roles_privileges
(
    role_id bigint not null,
    privilege_id int    not null,
    primary key (role_id, privilege_id),
    foreign key (role_id) references roles (id),
    foreign key (privilege_id) references privileges (id)
);

insert into privileges (name)
values ('READ'),
       ('WRITE'),
       ('CREATE'),
       ('DELETE'),
       ('ADMINISTRATION');

insert into roles (name)
values ('ROLE_USER'),
       ('ROLE_ADMIN');

insert into users (username, password, email)
values ('user', '$2a$04$Fx/SX9.BAvtPlMyIIqqFx.hLY2Xp8nnhpzvEEVINvVpwIPbA3v/.i', 'user@gmail.com'),
       ('admin','$2a$12$FL76wRI/Zx0dZ/gkWgtgzuFtdOKRlq2uMqwHvqjq71BJoX9hYh5y2','admin@gmail.com'),
       ('guest','$2a$04$Fx/SX9.BAvtPlMyIIqqFx.hLY2Xp8nnhpzvEEVINvVpwIPbA3v/.i','guest@gmail.com') ;


insert into roles_privileges (role_id, privilege_id)
values (1, 1),
       (2, 5);

insert into users_roles (user_id, role_id)
values (1, 1),
       (2, 2);