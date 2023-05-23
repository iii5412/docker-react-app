#builder stage
FROM node as builder
WORKDIR '/usr/src/app'
COPY package.json ./
RUN npm install
COPY ./ ./
#운영환경에서는 start가 아닌 배포를 위해 build가 들어간다.
CMD ["npm", "run", "build"] 

#run stage
#Nginx 설정시작
#위 npm run build에서 생성한 빌드 파일들을 Nginx 서버가 브라우저 요청에 응답한다.
#Nginx 도커이미지를 이용한 Nginx 시작 명령어 작성
FROM nginx
COPY --from=builder /usr/src/app/build /usr/share/nginx/html




