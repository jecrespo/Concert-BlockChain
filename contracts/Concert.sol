pragma solidity ^0.5.0;

contract Concert {
    address payable owner;
    string public concertName;
    uint public ticketPrice;
    mapping(address => bool) customer;
    
    constructor(string memory _concertName, uint _etherPrice) public{
        owner = msg.sender;
        concertName = _concertName;
        ticketPrice = _etherPrice * 1 ether;
    }
    
    function buyTicket() public payable {
        require(msg.value == ticketPrice, "IncorrectPrice");
        if (_isCustomer(msg.sender) == false) {
            _setPurchaseStaus(msg.sender,true);
        }
        else {
            revert("AlreadyClient");
        }
    }
    
    function refundTicketToAccount(address payable _to) public {
        if(_isCustomer(msg.sender) ==  true) {
            _to.transfer(ticketPrice);
            _setPurchaseStaus(msg.sender,false);
        }
        else {
            revert();
        }
    }
    
    function _isCustomer(address account) private view returns(bool){
        return customer[account];
    }
    
    function _setPurchaseStaus(address account, bool purchased) private {
        customer[account] = purchased;
    }
}