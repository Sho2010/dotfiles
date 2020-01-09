function sw-aws-environment() {
  if [ ! -z $1 ]; then
    echo "Set AWS_PROFILE=$1"
    export AWS_PROFILE=$1
    return
  fi

#   read -r -d '' envs <<-'EOF'
# staging
# production
# EOF
#
#   env=$(echo $envs | peco)

  env=$(cat ~/.aws/config | grep -e '\[.*' | peco | tr -d [ | tr -d ] )

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

