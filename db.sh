sudo apt update
sudo apt install mysql-server -y
sudo sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mysql.conf.d/mysqld.cnf
sudo systemctl restart mysql

sudo mysql -e "CREATE USER 'db'@'%' IDENTIFIED BY 'Password&1';"
sudo mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'db'@'%';"
sudo mysql -e "FLUSH PRIVILEGES;"
sudo mysql -e "DROP SCHEMA IF EXISTS Users;
CREATE SCHEMA Users;
USE Users;
CREATE TABLE accesso(
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(1000) ,
    password VARCHAR(1000),
    nome VARCHAR(1000),
    cognome VARCHAR(1000),
    citta VARCHAR(1000),
    tipo VARCHAR(1000)
);

INSERT INTO accesso(username, password, nome, cognome, citta, tipo) VALUES ('admin', 'admin', 'Bill', 'Gates', 'Locarno', 'admin');
INSERT INTO accesso(username, password, nome, cognome, citta, tipo) VALUES ('user', 'user', 'Lucio', 'Bernasconi', 'Lugano', 'user');"
sudo mysql -e "use Users;
