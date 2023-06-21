#!/bin/sh

# Parameters
dir=examples
dataset_path=resources/datasets/biscuits.csv
dataset_name=biscuits
model_name=biscuits-model
training_path=resources/campaigns/biscuits/parameters.json
predict_path=resources/campaigns/biscuits/eval.csv
processor=cpu

# Run tests
$dir/get_user.sh &&
$dir/get_versions.sh &&
$dir/upload_dataset.sh $dataset_path $dataset_name &&
$dir/list_datasets.sh &&
$dir/view_dataset.sh $dataset_name &&
training_response=$($dir/train_model.sh $training_path $model_name $processor) &&
echo "Training response: $training_response" &&
training_handle=$(echo "${training_response}" | jq -r '.training_status_handle') &&
echo "Training handle: $training_handle" &&
sleep 5 &&
$dir/list_models.sh &&
$dir/predict_model.sh $predict_path $model_name predict $processor &&
$dir/delete_model.sh $model_name &&
$dir/delete_dataset.sh $dataset_name