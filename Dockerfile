FROM nginx

RUN apt-get update && apt-get install -y curl

RUN curl https://raw.githubusercontent.com/puppetlabs/exercise-webpage/master/index.html > /usr/share/nginx/html/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
