# docker-tftp server
docker build -t tftp-server:1.0 .
docker run -it -d --net=host tftp-server:1.0

#tftp client
tftp TFTP-IP

