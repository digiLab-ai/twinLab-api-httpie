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

### Admin commands

-   [Create a user](./examples/create_user.sh)
-   [View the database](./examples/get_database.sh)

### User commands

#### Information

-   [View the stack versions](./examples/get_versions.sh)

#### Profile

-   [View user profile](./examples/get_user.sh)

#### Dataset management

-   [List a user's datasets](./examples/list_datasets.sh)
-   [Upload a dataset](./examples/upload_dataset.sh)
-   [Summarise a dataset](./examples/summarise_dataset.sh)
-   [Download a dataset](./examples/view_dataset.sh)
-   [Delete a dataset](./examples/delete_dataset.sh)

#### Model management

-   [List a user's models](./examples/list_models.sh)
-   [Train a model](./examples/train_model.sh)
-   [View the training status of a model](./examples/status_model.sh)
-   [Summarise a model](./examples/summarise_model.sh)
-   [Use a trained model](./examples/use_model.sh)
-   [Delete a model](./examples/delete_model.sh)
