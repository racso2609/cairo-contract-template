# Declare this file as a StarkNet contract.
%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.starknet.common.syscalls import get_caller_address
from starkware.cairo.common.math import assert_nn

# Define a storage variable.
@storage_var
func balance(user : felt) -> (res : felt):
end

# Increases the balance by the given amount.
@external
func increase_balance{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr}(
    amount : felt
):
    with_attr error_message("Amount must be positive. Got: {amount}."):
        assert_nn(amount)
    end

    let (caller_address) = get_caller_address()
    let (res) = balance.read(caller_address)
    balance.write(caller_address, res + amount)
    return ()
end

# Returns the current balance.
@view
func get_balance{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr}(
    user : felt
) -> (res : felt):
    let (res) = balance.read(user)
    return (res)
end
