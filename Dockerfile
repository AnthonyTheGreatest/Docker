# base image:
FROM node:18
# Create new user in container:
RUN addgroup app && adduser --system -ingroup app app
# working directory in container:
WORKDIR /app
# install dependencies in container:
COPY package*.json ./
RUN npm install
# copy folders and files from our computer to the container:
COPY . .
# change ownership:
RUN chown -R app:app /app
RUN chmod 755 /app
# change to created user:
USER app
# port in container:
EXPOSE 3000
# start container with commands:
CMD [ "npm", "start" ]