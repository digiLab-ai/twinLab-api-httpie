source "$(dirname "$0")/../api.sh"

training_parameters_path=$1
model_name=$2
processor_type=$3

train_model ${training_parameters_path} ${model_name} ${processor_type}
