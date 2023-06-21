source "$(dirname "$0")/../api.sh"

prediction_input_path=$1
model_id=$2
method=$3
processor_type=$3

use_model ${prediction_input_path} ${model_id} ${method} ${processor_type}
