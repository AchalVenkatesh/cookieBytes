// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract Ownable {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the address provided by the deployer as the initial owner.
     */
    // constructor(address initialOwner) {
    //     _transferOwnership(initialOwner);
    // }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        _checkOwner();
        _;
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view virtual returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if the sender is not the owner.
     */
    function _checkOwner() internal view virtual {
        require(owner() == msg.sender);
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby disabling any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        _transferOwnership(address(0));
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(owner() == msg.sender);
        _transferOwnership(newOwner);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Internal function without access restriction.
     */
    function _transferOwnership(address newOwner) internal virtual {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}

contract SignaturesInEth is Ownable {

    function _split(bytes memory signature) internal pure returns(bytes32 r, bytes32 s, uint8 v) {
        require(signature.length == 65, "Signature must be 65 bytes long");
        assembly {
            r := mload(add(signature, 32))
            s := mload(add(signature, 64))
            v := byte(0, mload(add(signature, 96)))
        }
    }

    function getMessageHash(string memory message) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(message));
    }

    function getEthSignedMessageHash(bytes32 messageHash) public pure returns(bytes32) {
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", messageHash));
    }

    function recover(bytes32 ethSignedMessageHash, bytes memory signature) public pure returns(address) {
        (bytes32 r, bytes32 s, uint8 v) = _split(signature);
        return ecrecover(ethSignedMessageHash, v, r, s);
    }

    function verifySignature(string memory message, bytes memory signature) public pure returns(address) {
        bytes32 messageHash = getMessageHash(message);
        bytes32 ethSignedMessageHash = getEthSignedMessageHash(messageHash);

        return recover(ethSignedMessageHash, signature);
    }

} 

contract Secure is SignaturesInEth{
    event NewAgreement(uint timeLimit);

    struct Agreement{
        string name;
        uint32 time_limit;
    }

    struct lease{
        address lessee;
        Agreement needed;
        bool isSigned;
    }

    mapping(string =>address) agreementToLessees;
    mapping(string =>uint32) agreementToCount; 

    Agreement[] public agreements;

    function create_contract(uint  _timeLimit, string calldata _name) public onlyOwner{
        agreements.push(Agreement(_name ,uint32(_timeLimit)));
        emit NewAgreement(_timeLimit);
    }

    function _generateRandomKey(address _str) private pure returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % 16;
    }

    function lease_data(string calldata _nameOfAgreement) public returns (address, uint){
        address lessee = msg.sender;
        agreementToLessees[_nameOfAgreement] = lessee;
        agreementToCount[_nameOfAgreement]++;
        uint key = _generateRandomKey(lessee);
        return (lessee, key);
    }

    function _revokeAccess(uint _registeredTime, uint _timeLimit, string calldata _str ) public view returns(uint){
        require(uint(block.timestamp - _registeredTime)>=_timeLimit);
        uint newkey = uint(keccak256(abi.encodePacked(_str)));
        return newkey;
    }
}