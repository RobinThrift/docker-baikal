# Baikal Docker
[Baikal](https://github.com/netgusto/Baikal) CardDAV and CalDAV server using Docker.

## Config
- port `9000` is exposed
- volume `/baikal/data` is used for data storage

## Usage
- `make build` will build the image
- `make push` will push the image to docker hub
- `make test` tests the image
