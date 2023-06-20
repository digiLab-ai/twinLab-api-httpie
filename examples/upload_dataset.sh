source "$(dirname "$0")/../api.sh"

dataset_path=$1
dataset_id=$2

upload_dataset ${dataset_path} ${dataset_id}
