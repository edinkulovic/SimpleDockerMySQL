# Simple Docker My SQL

This project is all about setting up MySQL database under Docker for testing and/or development purpose on your local/dev environment. 
Entire setup is done for Mac or Linux but with small adjustments could be used on Windows.
This setup SHOULD NOT be used in production.

For more details about Docker, MySQL and MySQL Docker Container please check these links:

- https://www.docker.com/
- https://hub.docker.com/r/mysql/mysql-server/
- https://www.mysql.com/

## 0. Install docker 

 - This project is not about setting up docker, but excellent explanation could be found on Docker Official Web Site: https://www.docker.com/
 

## 1. Setup local folder to store Database Files

 - Create new folder /private/var/lib/mysql on your host machine


## 2. Run the Container

```
docker run -d -v /private/var/lib/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=my-big-root-password -e MYSQL_DATABASE=my-test-db -e MYSQL_USER=test-user -e MYSQL_PASSWORD=test-user-pass -p 6603:3306 --name mysql-database mysql:latest --explicit_defaults_for_timestamp=TRUE
```

If all is entered correctly in the command above, you shoud get output like this 
```
...
2017-01-28T20:39:52.158308Z 0 [Note] mysqld: ready for connections.
Version: '5.7.17'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  MySQL Community Server (GPL)
```

For more details about docker run command check: https://docs.docker.com/engine/reference/run/

## 3. Check the logs

`docker run -d` will start container in detached mode, if you want to see what is going on under the hood, use docker logs command:
```
docker logs mysql-database
``` 
(where mysql-database is name of the container) 

## 4. Validate that container is running 

To validate if container is running you can use:
```
docker ps
``` 

In some cases if container is not started but it's created and you do not see it with command above, you could use:
``` 
docker ps -a
```

The -a flag tells docker run to bind to the container’s STDIN, STDOUT or STDERR. This makes it possible to manipulate the output and input as needed.

## TODO
 - Add support for external mysql config file instead of passing it as an argument like `explicit_defaults_for_timestamp`
 - Add support for initial script execution 
 - Add support for more Secured Container Startup with MYSQL_RANDOM_ROOT_PASSWORD and MYSQL_ONETIME_PASSWORD
 - Update README
