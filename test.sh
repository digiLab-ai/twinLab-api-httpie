#!/bin/sh

# Parameters
DIR=examples
DATASET_PATH=resources/datasets/biscuits.csv
DATASET_NAME=biscuits
MODEL_NAME=biscuits-model
TRAIN_PATH=resources/campaigns/biscuits/parameters.json
PREDICT_PATH=resources/campaigns/biscuits/eval.csv
PROCESSOR=cpu
WAIT_TIME=10

# Run tests
$DIR/get_user.sh &&
$DIR/get_versions.sh &&
$DIR/upload_dataset.sh $DATASET_PATH $DATASET_NAME &&
$DIR/list_datasets.sh &&
$DIR/view_dataset.sh $DATASET_NAME &&
training_response=$($DIR/train_model.sh $TRAIN_PATH $MODEL_NAME $PROCESSOR) &&
echo "Training response: $training_response" &&
training_handle=$(echo "${training_response}" | jq -r '.training_status_handle') &&
echo "Training handle: $training_handle" &&
echo "Waiting $WAIT_TIME s for training to complete..." &&
sleep $WAIT_TIME &&
$DIR/list_models.sh &&
$DIR/use_model.sh $predict_path $MODEL_NAME "predict" $PROCESSOR &&
$DIR/delete_model.sh $MODEL_NAME &&
$DIR/delete_dataset.sh $DATASET_NAME