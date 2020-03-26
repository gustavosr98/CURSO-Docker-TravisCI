# node to compile, then it will be deleted
FROM node:alpine as builder 
# as --> to use an alias for this step
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# nginx to serve the static files
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# --from --> to reference to another step 

# $ docker run -p <somePort>:80 <containerId> 
