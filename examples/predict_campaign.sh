source "$(dirname "$0")/../api.sh"

prediction_input_path=$1
campaign_id=$2
processor_type=$3

predict_campaign ${prediction_input_path} ${campaign_id} ${processor_type}
