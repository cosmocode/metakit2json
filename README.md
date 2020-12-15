# metakit2json

This is a Docker image and a simple python script to dump a [metakit](https://www.equi4.com/metakit/) database into JSON files.

## Building the Docker image

```
docker build -t metakit2json .
```

## Running the Image

```
docker run --rm  -v `pwd`:/mnt metakit2json <mydatabase>
```

This will write one json file per view to the current directory.

