# Docker image for WordHugoPress

I created this container because I wanted to use the script [wordhugopress](https://github.com/nantipov/wordhugopress/) without installing too much stuff that I have to remove again from my system afterwards.

## Setup

Create the directory `output`. Copy `application.yaml.sample` to `application.yaml` and edit it as you need.



## Run

If you only want to use it you can just run it:

    docker run --rm --network="host" \
      --mount type=bind,src=/path/to/wordpress-xml/,dst=/input/ \
      --mount type=bind,src=/path/to/output/,dst=/opt/wordhugopress/output/ \
      --mount type=bind,src=/path/to/application.yaml,dst=/opt/wordhugopress/src/main/resources/application.yaml \
      geschnei/wordhugopress

Change `/path/to/...` to the locations where your directory and files are located.

Parameter explanation:

- `--rm`: removes the container automatically after the run. It's not needed anymore, so we can clean up
- `--network="host"`: You need this if you want to connect to a MySQL server running on localhost
- The `--mount` options are, in order, the base directory of WordPress as input, the output directory and the path to the `application.yaml`

## Build

Clone the repository recursive to check out the exitwp-for-hugo as well

    git clone --recurse-submodules https://github.com/schneidr/docker-wordhugopress.git

Adapt what you need and build the image:

    docker build --tag wordhugopress .

Now you can run the image, as above.
