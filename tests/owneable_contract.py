"""contract.cairo test file."""
import os

import pytest
from starkware.starknet.testing.starknet import Starknet

# The path to the contract source code.
CONTRACT_FILE = os.path.join("contracts", "owneable.cairo")
# print(CONTRACT_FILE)

@pytest.mark.asyncio
async def tets_owner_contract():
    """Test set contract on constructor."""
    # Create a new Starknet class that simulates the StarkNet
    # system.
    starknet = await Starknet.empty()

    # Deploy the contract.
    contract = await starknet.deploy(
        source=CONTRACT_FILE,
    )
    owner_address=''
    owner = await contract.get_owner().call()
    assert owner.result == (owner_address)


