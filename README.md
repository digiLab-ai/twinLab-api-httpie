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

### Show user information
```shell
sh examples/get_user.sh
```

### Show version information
```shell
sh examples/get_versions.sh
```

### Upload a dataset
```shell
sh examples/upload_dataset.sh <path/to/dataset.csv> <dataset_id>
sh examples/upload_dataset.sh resources/datasets/biscuits.csv biscuits
```

### List datasets
```shell
sh examples/list_datasets.sh
```

### View a dataset
```shell
sh examples/view_dataset.sh <dataset_id>
sh examples/view_dataset.sh biscuits
```

### Summarise a dataset
```shell
sh examples/summarise_dataset.sh <dataset_id>
sh examples/summarise_dataset.sh biscuits
```

### Train model
```shell
sh examples/train_model.sh <path/to/parameters.json> <model_id> <processor>
sh examples/train_model.sh resources/campaigns/biscuits/parameters.json biscuits-model cpu
```

### List trained models
```shell
sh examples/list_models.sh
```

### Summarise a trained model
```shell
sh examples/summarise_model.sh <model_id>
sh examples/summarise_model.sh biscuits-model
```

### Make predictions from a trained model
```shell
sh examples/use_model.sh <path/to/input.csv> <model_id> <method> <processor>
sh examples/use_model.sh resources/campaigns/biscuits/eval.csv biscuits-model predict cpu
```

### Delete a model
```shell
sh examples/delete_model.sh <model_id>
sh examples/delete_model.sh biscuits-model
```

### Delete a dataset
```shell
sh examples/delete_dataset.sh <dataset_id>
sh examples/delete_dataset.sh biscuits
```
