source api.sh

# Parameters
dataset_path=resources/datasets/biscuits.csv
dataset_name=biscuits
model_name=biscuits-model
train_path=resources/campaigns/biscuits/parameters.json
predict_path=resources/campaigns/biscuits/eval.csv
processor=cpu
wait_time=10

# Run tests
get_user &&
get_versions &&
upload_dataset $dataset_path $dataset_name &&
list_datasets &&
view_dataset $dataset_name &&
training_response=$(train_model $train_path $model_name $processor) &&
echo "Training response: $training_response" &&
training_handle=$(echo "${training_response}" | jq -r '.training_status_handle') &&
echo "Training handle: $training_handle" &&
echo "Waiting $wait_time s for training to complete..." &&
sleep $wait_time &&
list_models &&
use_model $predict_path $model_name "predict" $processor &&
delete_model $model_name &&
delete_dataset $dataset_name