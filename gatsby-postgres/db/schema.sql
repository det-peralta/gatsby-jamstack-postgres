create extension citext;

create table users (
  id serial primary key,
  username citext not null unique
);

create table products (
  id serial primary key,
  author_id int not null references users,
  title text,
  body text,
  price money,
  stock boolean,
  created_at timestamptz not null default now()
);
