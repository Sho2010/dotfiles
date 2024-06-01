function sw-aws-environment() {

  if [ ! -z $1 ]; then
    echo "Set AWS_PROFILE=$1"
    export AWS_PROFILE=$1
    return
  fi

  env=$(cat ~/.aws/config | grep -e '\[.*' | peco | tr -d [ | tr -d ] )
  # delete profile prefix if exists
  env=$(echo $env | sed -e 's/^profile //')

  if [ ! -z $env ]; then
    echo "Set AWS_PROFILE=$env"
    export AWS_PROFILE=$env
  fi
}

function sw-aws-profile() {
  sw-aws-environment $@
}

function sw-aws-region() {

  read -r -d '' regions <<-'EOF'
us-east-1
ap-northeast-1
EOF

  region=$(echo $regions | peco)

  if [ ! -z $region ]; then
    echo "Set AWS_REGION=$region"
    export AWS_REGION=$region
    export AWS_DEFAULT_REGION=$region
  fi

}

function sso-login-topotal() {
  aws sso login --profile topotal-sre
}
