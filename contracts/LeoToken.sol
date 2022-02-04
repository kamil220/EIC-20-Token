//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.0;

import 'hardhat/console.sol';

contract LeoToken {

    string public name = 'Leocode Token';
    string public symbol = 'LEO';
    uint8 public decimals = 18;

    mapping( address => uint256 ) public balanceOf;
    mapping( address => mapping( address => uint256 ) ) public allowance;

    constructor() {
        balanceOf[msg.sender] = totalSupply();
    }

    modifier nonZeroAddress( address _address ) {
        require( _address != ethers.constants.zeroAddress, 'Zero address is not allowed.' );
    }

    modifier hasEnoughAmount( address _sender, uint256 _value ) {
        require( balanceOf[ _sender ] >= _value, 'The sender does not have an enough amount' );
    }

    function totalSupply() public view returns ( uint256 ) {
        return 100_000 * ( 10 ** decimals );
    }

    function transfer( address _to, uint256 _value ) public nonZeroAddress ( _to ) hasEnoughAmount( msq.sender, _value ) returns ( bool success ) {
        balanceOf[ _sender ] -= _value;
        balanceOf[ _to ] += _value;
        emit Transfer( _sender, _to, _value );
        return true;
    }

    function approve( address _spender, uint256 _value ) public nonZeroAddress( _spender ) _value returns ( bool success ) {
        allowance[ msq.sender ][ _spender ] = _value;
        emit Approval( msq.sender, _spender, _value );
        return true;
    }

    function transferFrom( address _from, address _to, uint256 _value ) public returns ( bool success );

    /* Start Events */
    event Transfer( address indexed _from, address indexed _to, uint256 _value );
    event Approval( address indexed _owner, address indexed _spender, uint256 _value );
}
