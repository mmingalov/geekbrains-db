/* #2
 *  Создайте базу данных example, разместите в ней таблицу users, состоящую из двух столбцов, числового id и строкового name
 *  Launch via command: source D:/Cloud/Git/geekbrains-db/topic2/2_create db and table.sql ;
 */

drop database if exists example;
create database example;
use example;
create table users (id int primary key, name nvarchar(100) not null);