source ".env"

RAPID_HEADERS=""X-RapidAPI-Key:${TWINLAB_KEY}" "X-RapidAPI-Host:${TWINLAB_HOST}""
OTHER_HEADERS=""X-RapidAPI-Proxy-Secret:${TWINLAB_SECRET}" "X-RapidAPI-User:${TWINLAB_USERNAME}""
if [[ ${TWINLAB_SERVER} == *"rapidapi"* ]]; then
    headers=${RAPID_HEADERS}
else
    headers=${OTHER_HEADERS}
fi

get_user() {

    url="${TWINLAB_SERVER}/user"
    http GET ${url} ${headers}

}

get_versions() {

    url="${TWINLAB_SERVER}/versions"
    http GET ${url} ${headers}

}

list_datasets() {

    url="${TWINLAB_SERVER}/datasets"
    http GET ${url} ${headers}

}

upload_dataset() {

    if [ -z "$2" ]; then
        echo "Usage: $0 <path/to/datase.csv> <dataset_id>"
        exit 1
    fi
    dataset_path=$1
    dataset_id=$2

    url="${TWINLAB_SERVER}/datasets/${dataset_id}"
    cat ${dataset_path} |
        http PUT ${url} ${headers} \
            "Content-Type:text/plain"
}

view_dataset() {

    if [ -z "$1" ]; then
        echo "Usage: $0 <dataset_id>"
        exit 1
    fi
    dataset_id=$1

    url="${TWINLAB_SERVER}/datasets/${dataset_id}"
    http GET ${url} ${headers}

}

summarise_dataset() {

    if [ -z "$1" ]; then
        echo "Usage: $0 <dataset_id>"
        exit 1
    fi
    dataset_id=$1

    url="${TWINLAB_SERVER}/datasets/${dataset_id}/summarise"
    http GET ${url} ${headers}

}

delete_dataset() {

    if [ -z "$1" ]; then
        echo "Usage: $0 <dataset_id>"
        exit 1
    fi
    dataset_id=$1

    url="${TWINLAB_SERVER}/datasets/${dataset_id}"
    http DELETE ${url} ${headers}

}

list_models() {

    url="${TWINLAB_SERVER}/models"
    http GET ${url} ${headers}

}

train_model() {

    if [ -z "$3" ]; then
        echo "Usage: $0 <path/to/parameters.csv> <model_id> <processor>"
        exit 1
    fi
    training_parameters_path=$1
    model_id=$2
    processor=$3

    url="${TWINLAB_SERVER}/models/${model_id}"
    cat ${training_parameters_path} |
        http PUT ${url} ${headers} \
            "X-Processor:${processor}" \
            "Content-Type:application/json"

}

status_model() {

    if [ -z "$1" ]; then
        echo "Usage: $0 <model_id>"
        exit 1
    fi
    model_id=$1

    url="${TWINLAB_SERVER}/models/${model_id}"
    http GET ${url} ${headers}

}

summarise_model() {

    if [ -z "$1" ]; then
        echo "Usage: $0 <model_id>"
        exit 1
    fi
    model_id=$1

    url="${TWINLAB_SERVER}/models/${model_id}/summarise"
    http GET ${url} ${headers}

}

use_model() {

    if [ -z "$3" ]; then
        echo "Usage: $0 <path/to/inputs.csv> <model_id> <method> <processor>"
        exit 1
    fi
    prediction_input_path=$1
    model_id=$2
    method=$3
    processor_type=$4

    url="${TWINLAB_SERVER}/models/${model_id}/${method}"
    cat ${prediction_input_path} |
    http POST ${url} ${headers} \
        "X-Processor:${processor_type}" \
        "Content-Type:text/plain"

}

delete_model() {

    if [ -z "$1" ]; then
        echo "Usage: $0 <model_id>"
        exit 1
    fi
    model_id=$1

    url="${TWINLAB_SERVER}/models/${model_id}"
    http DELETE ${url} ${headers}

}
