source "$(dirname "$0")/../api.sh"

user_parameters_path=$1
user_name=$2

create_user ${user_parameters_path} ${user_name}
