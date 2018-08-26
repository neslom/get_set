# GetSet

`docker-compose up` starts the app

## Usage

`curl http://localhost:4000/api/status` should return "PONG" if all is well
`curl -XPUT http://localhost:4000/redis/keys/3 -d value=three` to set a value for a key
`curl http://localhost:4000/redis/keys/3` will read the key
