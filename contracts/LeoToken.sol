//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.0;

import 'hardhat/console.sol';

contract LeoToken {

    string public name = 'Leocode Token';
    string public symbol = 'LEO';
    uint8 public decimals = 18;

    mapping( address => uint256 ) public balanceOf;

    constructor() {
        balanceOf[msg.sender] = totalSupply();
    }

    modifier nonZeroAddress( address _address ) {
        require( _address != ethers.constants.zeroAddress, 'Zero address is not allowed.' );
    }

    function totalSupply() public view returns ( uint256 ) {
        return 100_000 * ( 10 ** decimals );
    }

    function transfer( address _to, uint256 _value ) public nonZeroAddress ( _to ) _value returns ( bool success ) {
        return;
    }

    function transferFrom( address _from, address _to, uint256 _value ) public returns ( bool success );
    function approve( address _spender, uint256 _value ) public returns ( bool success );
    function allowance( address _owner, address _spender ) public view returns ( uint256 remaining );

    /* Start Events */
    event Transfer( address indexed _from, address indexed _to, uint256 _value );
    event Approval( address indexed _owner, address indexed _spender, uint256 _value );
}
