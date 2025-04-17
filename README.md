# mbentley/go-grip

docker image for [go-grip](https://github.com/chrishrb/go-grip)
based off of scratch

To pull this image:
`docker pull mbentley/go-grip`

Example usage:

```bash
docker run -it --rm \
  -p 6419:6419 \
  -v "${PWD}:/data" \
  mbentley/go-grip
```
