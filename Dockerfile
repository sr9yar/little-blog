FROM ruby:2.6

ARG DEBIAN_FRONTEND=noninteractive
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

ADD project /project
WORKDIR /project
RUN bundle install


ADD entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]
# EXPOSE 3000

CMD ["entrypoint.sh"]

# CMD ["tail", "-f", "/dev/null"]

