FROM elixir:1.10-alpine
RUN apk add inotify-tools
RUN mkdir /app
RUN adduser -D phoenix
WORKDIR /app
COPY . /app
RUN mix local.hex --force  && mix local.rebar --force

#COPY . /app
RUN mix deps.get 
RUN mix deps.compile
#EXPOSE 4001