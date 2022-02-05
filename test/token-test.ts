import { expect } from 'chai';
import { Contract } from 'ethers';
import {ethers} from 'hardhat';

describe("LeoToken", function () {
    let owner, notOwner;
    let token: Contract;

    const tokenCount = 100000;
    const zeroAddress = ethers.constants.AddressZero;
    const totalAmount = ethers.constants.WeiPerEther.mul( tokenCount ); // 1 wei has 18 decimals
    const decimals = 18;

    const messages = {
        errorZeroAddress: 'Zero address is not allowed',
        errorLackOfMoney: 'Not enough tokens',
        errorNotAllowed: 'Not allowed to transfer tokens',
        checkName: 'The name of token should be `Leocode Token`',
        checkSymbol: 'The symbol of token should be `LEO`',
        checkDecimals: 'The token should have 18 decimals',
        checkTotalAmount: 'Check total amount of token',
        checkSenderZeroAddress: 'Throw exception when sender address is null',
        checkReceiverZeroAddress: 'Throw exception when receiver address is null',
    };

    beforeEach( async() => {
       const Token = await ethers.getContractFactory( 'LeoToken' );
       token = await Token.deploy();
       await token.deployed();
    });

    it( messages.checkName, async() => {
        expect( await token.name() ).to.equal('Leocode Token' );
    });

    it( messages.checkSymbol, async() => {
        expect( await token.symbol() ).to.equal( 'LEO' );
    });

    it( messages.checkDecimals, async() => {
        expect( await token.decimals() ).to.equal( decimals );
    })

    it( messages.checkTotalAmount, async() => {
       const total = await token.totalSupply();
       expect( total.eq( totalAmount ) ).to.equal( true )
    });

    it( messages.checkReceiverZeroAddress, async() => {
        await expect( token.transfer( zeroAddress, 1 ) ).to.be.revertedWith( 'Zero address is not allowed' );
    });

    it( messages.checkSenderZeroAddress, async() => {
        const [{address: senderAddress}] = await ethers.getSigners();

        await expect( token.transferFrom( senderAddress, zeroAddress, 1 ) ).to.be.revertedWith( 'Zero address is not allowed' );
    });


} );
