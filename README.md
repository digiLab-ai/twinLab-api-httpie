# HTTPIE twinLab API

This is how one can use the `twinLab API` directly from the terminal using the [HTTPie](https://httpie.io/) (`brew install httpie`) command line tool.

First, you need to set up the environment variables in the top-level [`.env`](.env) file.
You can copy the [`.env.example`](.env.example) file as a template:

```shell
cp .env.example .env
open .env
```

If you are running locally, you need to set the `TWINLAB_USERNAME` and `TWINLAB_SECRET` variables.
If you are running through RapidAPI then you need to set the `TWINLAB_KEY` and `TWINLAB_HOST` variables.

## API

All the endpoints are wrapped into functions in the [`api.sh`](./api.sh) file.
You can source this file directly from your terminal to use the functions:

```shell
source api.sh
```

The scripts in the [`examples`](./examples) folder demonstrate how to use these functions.

-   [`Get user information`](./examples/get_user.sh)
-   [`Upload a dataset`](./examples/upload_dataset.sh)
-   [`Delete a dataset`](./examples/delete_dataset.sh)
