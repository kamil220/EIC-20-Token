import { expect } from 'chai';
import { ethers } from 'hardhat';

describe("LeoToken", function () {
    let owner, notOwner;
    let token;

    const tokenCount = 100000;
    const zeroAddress = ethers.constants.AddressZero;
    const totalAmount = ethers.constants.WeiPerEther.mul( tokenCount ); // 1 wei has 18 decimals

    const messages = {
        errorZeroAddress: 'Zero address is not allowed',
        errorLackOfMoney: 'Not enough tokens',
        errorNotAllowed: 'Not allowed to transfer tokens'
    };

    beforeEach( async() => {
       const Token = await ethers.getContractFactory( 'LeoToken' );
       token = await Token.deploy();
       await token.deployed();
    });

} );
