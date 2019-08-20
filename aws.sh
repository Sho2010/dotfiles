function sw-aws-environment() {
  read -r -d '' envs <<-'EOF'
staging
production
EOF

  env=$(echo $envs | peco)

  if [ ! -z $env ]; then
    echo "Set AWS_REGION=$env"
    export AWS_PROFILE=$env
  fi

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
  fi

}

