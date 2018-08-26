FROM elixir:latest

RUN mix local.hex --force
RUN mix local.rebar --force

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ENV MIX_ENV=dev
ENV PORT=4000

ADD . $APP_HOME
RUN mix do deps.clean --all, deps.get, compile

EXPOSE $PORT
CMD elixir --erl "+K true" -S mix phoenix.server
