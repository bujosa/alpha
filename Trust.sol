pragma solidity =0.8.15;

contract Trust {
    address public kid;
    uint public maturity;

    constructor(address _kid, uint _maturity) payable {
        kid = _kid;
        maturity = block.timestamp + _maturity;
    }

    function withdraw() external {
        require(block.timestamp >= maturity, 'too early');
        require(msg.sender == kid, 'only kid can withdraw');
        payable(msg.sender).transfer(address(this).balance);
    }
}
