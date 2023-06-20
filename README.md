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

### Versions
```shell
sh examples/get_versions.sh
```

### User
```shell
sh examples/get_user.sh
```

### Upload a Dataset
```shell
sh examples/upload_dataset.sh <path/to/dataset.csv> <dataset_id>
sh examples/upload_dataset.sh resources/datasets/biscuits.csv biscuits
```

### List Datasets
```shell
sh examples/list_datasets.sh
```

### View a Dataset
```shell
sh examples/view_dataset.sh <dataset_id>
sh examples/view_dataset.sh biscuits
```

### Summarise a Dataset
```shell
sh examples/summarise_dataset.sh <dataset_id>
sh examples/summarise_dataset.sh biscuits
```

### Train Campaigns
```shell
sh examples/train_campaign.sh <path/to/parameters.json> <campaign_id> <processor>
sh examples/train_campaign.sh resources/campaigns/biscuits/parameters.json biscuits-campaign cpu
```

### List Campaigns
```shell
sh examples/list_campaigns.sh
```

### Summarise a Campaign
```shell
sh examples/summarise_campaign.sh <campaign_id>
sh examples/summarise_campaign.sh biscuits-campaign
```

### Make Predictions
```shell
sh examples/predict_campaign.sh <path/to/input.csv> <campaign_id> <processor>
sh examples/predict_campaign.sh resources/campaigns/biscuits/eval.csv biscuits-campaign predict cpu
```

### Delete a Campaign
```shell
sh examples/delete_campaign.sh <campaign_id>
sh examples/delete_campaign.sh biscuits-campaign
```

### Delete a Dataset
```shell
sh examples/delete_dataset.sh <dataset_id>
sh examples/delete_dataset.sh biscuits
```
