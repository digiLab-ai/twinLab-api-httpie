source "$(dirname "$0")/../api.sh"

training_parameters_path=$1
campaign_name=$2
processor_type=$3

train_campaign ${training_parameters_path} ${campaign_name} ${processor_type}
