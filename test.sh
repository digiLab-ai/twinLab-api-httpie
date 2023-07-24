source api.sh

# Parameters
dataset_path=resources/datasets/biscuits.csv
dataset_name=biscuits
model_name=biscuits-model
train_path=resources/campaigns/biscuits/parameters.json
predict_path=resources/campaigns/biscuits/eval.csv
processor=cpu
wait_time=1

# Run tests
get_user &&
    get_versions &&
    upload_dataset $dataset_path $dataset_name &&
    list_datasets &&
    view_dataset $dataset_name &&
    summarise_dataset $dataset_name &&
    list_models &&
    train_model $train_path $model_name $processor &&
    job_complete=false
while [ "$job_complete" = false ]; do
    response=$(status_model $model_name)
    job_complete=$(echo $response | jq -r '.job_complete')
    echo "Job finished: $job_complete"
    sleep $wait_time
done &&
    list_models &&
    summarise_model $model_name &&
    use_model $predict_path $model_name "predict" $processor &&
    delete_model $model_name &&
    delete_dataset $dataset_name &&
    echo "All tests PASSED!" ||
    echo "Tests fave FAILED!"
