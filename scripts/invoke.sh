NETWORK=alpha-goerli

if [[ $2  ]]; then
  NETWORK=$2
fi

starknet invoke \
    --address $1 \
    --abi $2 \
    --function $3 \
    --inputs $4 --network $NETWORK
