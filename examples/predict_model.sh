source "$(dirname "$0")/../api.sh"

prediction_input_path=$1
model_id=$2
processor_type=$3

predict_model ${prediction_input_path} ${model_id} ${processor_type}
