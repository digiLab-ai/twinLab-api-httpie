info_versions() {
    source ".env"

    url="${TWINLAB_SERVER}/versions"

    if [[ ${TWINLAB_SERVER} == *"rapidapi"* ]]; then
        http GET ${url} \
            "X-RapidAPI-Key:${TWINLAB_KEY}" \
            "X-RapidAPI-Host:${TWINLAB_HOST}"
    else
        http GET ${url} \
            "X-RapidAPI-Proxy-Secret:${TWINLAB_SECRET}" \
            "X-RapidAPI-User:${TWINLAB_USERNAME}"
    fi
}

info_user() {
    source ".env"

    url="${TWINLAB_SERVER}/user"

    if [[ ${TWINLAB_SERVER} == *"rapidapi"* ]]; then
        http GET ${url} \
            "X-RapidAPI-Key:${TWINLAB_KEY}" \
            "X-RapidAPI-Host:${TWINLAB_HOST}"
    else
        http GET ${url} \
            "X-RapidAPI-Proxy-Secret:${TWINLAB_SECRET}" \
            "X-RapidAPI-User:${TWINLAB_USERNAME}"
    fi
}

list_datasets() {
    source ".env"

    url="${TWINLAB_SERVER}/datasets"

    if [[ ${TWINLAB_SERVER} == *"rapidapi"* ]]; then
        http GET ${url} \
            "X-RapidAPI-Key:${TWINLAB_KEY}" \
            "X-RapidAPI-Host:${TWINLAB_HOST}"
    else
        http GET ${url} \
            "X-RapidAPI-Proxy-Secret:${TWINLAB_SECRET}" \
            "X-RapidAPI-User:${TWINLAB_USERNAME}"
    fi
}

upload_dataset() {
    source ".env"

    if [ -z "$2" ]; then
        echo "Usage: $0 <path/to/datase.csv> <dataset_id>"
        exit 1
    fi
    dataset_path=$1
    dataset_id=$2

    url="${TWINLAB_SERVER}/datasets/${dataset_id}"

    if [[ ${TWINLAB_SERVER} == *"rapidapi"* ]]; then
        cat ${dataset_path} |
            http PUT ${url} \
                "X-RapidAPI-Key:${TWINLAB_KEY}" \
                "X-RapidAPI-Host:${TWINLAB_HOST}" \
                "Content-Type:text/csv"
    else
        cat ${dataset_path} |
            http PUT ${url} \
                "X-RapidAPI-Proxy-Secret:${TWINLAB_SECRET}" \
                "X-RapidAPI-User:${TWINLAB_USERNAME}" \
                "Content-Type:text/csv"
    fi
}

view_dataset() {
    source ".env"

    if [ -z "$1" ]; then
        echo "Usage: $0 <dataset_id>"
        exit 1
    fi
    dataset_id=$1

    url="${TWINLAB_SERVER}/datasets/${dataset_id}"

    if [[ ${TWINLAB_SERVER} == *"rapidapi"* ]]; then
        http GET ${url} \
            "X-RapidAPI-Key:${TWINLAB_KEY}" \
            "X-RapidAPI-Host:${TWINLAB_HOST}"
    else
        http GET ${url} \
            "X-RapidAPI-Proxy-Secret:${TWINLAB_SECRET}" \
            "X-RapidAPI-User:${TWINLAB_USERNAME}"
    fi
}

summarise_dataset() {
    source ".env"

    if [ -z "$1" ]; then
        echo "Usage: $0 <dataset_id>"
        exit 1
    fi
    dataset_id=$1

    url="${TWINLAB_SERVER}/datasets/${dataset_id}/summarise"

    if [[ ${TWINLAB_SERVER} == *"rapidapi"* ]]; then
        http GET ${url} \
            "X-RapidAPI-Key:${TWINLAB_KEY}" \
            "X-RapidAPI-Host:${TWINLAB_HOST}"
    else
        http GET ${url} \
            "X-RapidAPI-Proxy-Secret:${TWINLAB_SECRET}" \
            "X-RapidAPI-User:${TWINLAB_USERNAME}"
    fi
}

delete_dataset() {
    source ".env"

    if [ -z "$1" ]; then
        echo "Usage: $0 <dataset_id>"
        exit 1
    fi
    dataset_id=$1

    url="${TWINLAB_SERVER}/datasets/${dataset_id}"

    if [[ ${TWINLAB_SERVER} == *"rapidapi"* ]]; then
        http DELETE ${url} \
            "X-RapidAPI-Key:${TWINLAB_KEY}" \
            "X-RapidAPI-Host:${TWINLAB_HOST}"
    else
        http DELETE ${url} \
            "X-RapidAPI-Proxy-Secret:${TWINLAB_SECRET}" \
            "X-RapidAPI-User:${TWINLAB_USERNAME}"
    fi
}

list_models() {
    source ".env"

    url="${TWINLAB_SERVER}/models"

    if [[ ${TWINLAB_SERVER} == *"rapidapi"* ]]; then
        http GET ${url} \
            "X-RapidAPI-Key:${TWINLAB_KEY}" \
            "X-RapidAPI-Host:${TWINLAB_HOST}"
    else
        http GET ${url} \
            "X-RapidAPI-Proxy-Secret:${TWINLAB_SECRET}" \
            "X-RapidAPI-User:${TWINLAB_USERNAME}"
    fi
}

train_model() {
    source ".env"

    if [ -z "$3" ]; then
        echo "Usage: $0 <path/to/parameters.csv> <model_id> <processor>"
        exit 1
    fi
    training_parameters_path=$1
    model_id=$2
    processor=$3

    url="${TWINLAB_SERVER}/models/${model_id}"

    if [[ ${TWINLAB_SERVER} == *"rapidapi"* ]]; then
        cat ${training_parameters_path} |
            http PUT ${url} \
                "X-RapidAPI-Key:${TWINLAB_KEY}" \
                "X-RapidAPI-Host:${TWINLAB_HOST}" \
                "X-Processor:${processor}" \
                "Content-Type:application/json"
    else
        cat ${training_parameters_path} |
            http PUT ${url} \
                "X-RapidAPI-Proxy-Secret:${TWINLAB_SECRET}" \
                "X-RapidAPI-User:${TWINLAB_USERNAME}" \
                "X-Processor:${processor}" \
                "Content-Type:application/json"
    fi
}

status_model() {
    source ".env"

    if [ -z "$1" ]; then
        echo "Usage: $0 <model_id>"
        exit 1
    fi
    model_id=$1

    url="${TWINLAB_SERVER}/models/${model_id}"

    if [[ ${TWINLAB_SERVER} == *"rapidapi"* ]]; then
        http GET ${url} \
            "X-RapidAPI-Key:${TWINLAB_KEY}" \
            "X-RapidAPI-Host:${TWINLAB_HOST}"
    else
        http GET ${url} \
            "X-RapidAPI-Proxy-Secret:${TWINLAB_SECRET}" \
            "X-RapidAPI-User:${TWINLAB_USERNAME}"
    fi
}

summarise_model() {
    source ".env"

    if [ -z "$1" ]; then
        echo "Usage: $0 <model_id>"
        exit 1
    fi
    model_id=$1

    url="${TWINLAB_SERVER}/models/${model_id}/summarise"

    if [[ ${TWINLAB_SERVER} == *"rapidapi"* ]]; then
        http GET ${url} \
            "X-RapidAPI-Key:${TWINLAB_KEY}" \
            "X-RapidAPI-Host:${TWINLAB_HOST}"
    else
        http GET ${url} \
            "X-RapidAPI-Proxy-Secret:${TWINLAB_SECRET}" \
            "X-RapidAPI-User:${TWINLAB_USERNAME}"
    fi
}

predict_model() {
    source ".env"

    if [ -z "$3" ]; then
        echo "Usage: $0 <path/to/inputs.csv> <model_id> <method> <processor>"
        exit 1
    fi
    prediction_input_path=$1
    model_id=$2
    method=$3
    processor_type=$4

    url="${TWINLAB_SERVER}/models/${model_id}/${method}"

    if [[ ${TWINLAB_SERVER} == *"rapidapi"* ]]; then
        cat ${prediction_input_path} |
            http POST ${url} \
                "X-RapidAPI-Key:${TWINLAB_KEY}" \
                "X-RapidAPI-Host:${TWINLAB_HOST}" \
                "X-Processor:${processor_type}" \
                "Content-Type:text/csv"
    else
        cat ${prediction_input_path} |
            http POST ${url} \
                "X-RapidAPI-Proxy-Secret:${TWINLAB_SECRET}" \
                "X-RapidAPI-User:${TWINLAB_USERNAME}" \
                "X-Processor:${processor_type}" \
                "Content-Type:text/csv"
    fi
}

delete_model() {
    source ".env"

    if [ -z "$1" ]; then
        echo "Usage: $0 <model_id>"
        exit 1
    fi
    model_id=$1

    url="${TWINLAB_SERVER}/models/${model_id}"

    if [[ ${TWINLAB_SERVER} == *"rapidapi"* ]]; then
        http DELETE ${url} \
            "X-RapidAPI-Key:${TWINLAB_KEY}" \
            "X-RapidAPI-Host:${TWINLAB_HOST}"
    else
        http DELETE ${url} \
            "X-RapidAPI-Proxy-Secret:${TWINLAB_SECRET}" \
            "X-RapidAPI-User:${TWINLAB_USERNAME}"
    fi
}
