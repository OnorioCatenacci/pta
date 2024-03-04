FROM elixir:1.16.1-otp-26-alpine AS builder

ARG mix_env=prod
ENV MIX_ENV=${mix_env}

WORKDIR /src
COPY mix.exs mix.lock /src/
RUN mix deps.get --only $MIX_ENV

ADD . . 
RUN mix release --path /app --quiet

FROM elixir:1.16.1-otp-26-alpine

ARG mix_env=prod
ENV MIX_ENV=${mix_env}
ENV DATABASE_URL=ecto://postgres:postgres@localhost/pta_dev
ENV SECRET_KEY_BASE=13qTAdCccNPsaqvX7h6uavyqhCaoXLYV4l2sdXjZRl+8wkNRdAvPsZxrDHOHDd3W

COPY --from=builder /app /app
WORKDIR /app

ENTRYPOINT ["/app/bin/pta"]
CMD ["start"]