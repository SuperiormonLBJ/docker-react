# 2 steps
# step 1, build phase
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build

#step 2 run phase
FROM nginx
# copy from 1st step and then take copied build arti/codes.... into nginx path
# type would cuase failure to reflect our application on localhost port
COPY --from=builder /app/build /usr/share/nginx/html
# nginx will take care of start cmd automatically so no need to specify



# To build img:
# docker build .

# To run: nginx is on port 80 by default
# docker run -p localport:80 img_id