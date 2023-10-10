mkdir docker_web //디렉토리를 만들어줌
cd docker_web //디렉토리 위치로 이동함
pwd //현재 위치가 docker_web로 들어와 있는지 확인해줌
vim Dockerfile //도커 파일을 만들어줌
docker build -t docker_web . //docker_web이라는 이름의 도커 이미지를 빌드해줌(이미지명:태그), 마지마에 구둣점까지 찍어 도커파일이 현재 디렉토리에 있다는 것을 보여줌
docker images //도커 이미지가 잘 생성되었는지 목록 확인
docker run -itd -p 8000:80 --name docker_web docker_web //이미지를 도커 컨테이너로 실행시켜줌, 원하는 포트(8000)로 열어서 해주면 됨.
docker ps //8000과 80포트가 서로 연결되었는지 확인

//웹 사이트(localhost:8000)에서 이미지가 생성된 것을 확인할 수 있다!//
----------------------------------------------------------
<Dockerfile>
FROM ubuntu:14.04
MAINTAINER "jungdahyun"
LABEL title "Web Application"
RUN apt-get update && apt-get -y install apache2 php5
RUN echo 'Docker Web Application' > /var/www/html/index.html
RUN echo '<?php phpinfo(); ?>' > /var/www/html/phpinfo.php
EXPOSE 80
WORKDIR /var/www/html
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
