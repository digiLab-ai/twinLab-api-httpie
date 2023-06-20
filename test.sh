#!/bin/sh

# Parameters
dir=examples
dataset_path=resources/datasets/biscuits.csv
dataset_name=biscuits
campaign_name=biscuits-campaign
training_path=resources/campaigns/biscuits/parameters.json
predict_path=resources/campaigns/biscuits/eval.csv
processor=cpu

# Run tests
$dir/get_versions.sh &&
$dir/get_user.sh &&
$dir/upload_dataset.sh $dataset_path $dataset_name &&
$dir/list_datasets.sh &&
$dir/view_dataset.sh $dataset_name &&
training_response=$($dir/train_campaign.sh $training_path $campaign_name $processor) &&
echo "Training response: $training_response" &&
training_handle=$(echo "${training_response}" | jq -r '.training_status_handle') &&
echo "Training handle: $training_handle" &&
sleep 5 &&
$dir/list_campaigns.sh &&
$dir/predict_campaign.sh $predict_path $campaign_name predict $processor &&
$dir/delete_campaign.sh $campaign_name &&
$dir/delete_dataset.sh $dataset_name