// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.4;

import {DSTest} from "@ds-test/test.sol";
import {Vm} from "@forge-std/Vm.sol";
import {ERC20_OZ} from "$/ERC20_OZ.sol";

// transfer
contract ERC20_OZ_transferToNonOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC20_OZ internal sut;

    function setUp() public {
        sut = new ERC20_OZ();
        sut.mint(address(0xAAAA), 1000 ether);
    }
    function test_transferToNonOwner() public {
        HEVM.prank(address(0xAAAA));
        sut.transfer(address(0xBBBB), 500 ether);
    }
}

contract ERC20_OZ_transferToOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC20_OZ internal sut;

    function setUp() public {
        sut = new ERC20_OZ();
        sut.mint(address(0xAAAA), 1000 ether);
        sut.mint(address(0xBBBB), 1000 ether);
    }
    function test_transferToOwner() public {
      HEVM.prank(address(0xAAAA));
        sut.transfer(address(0xBBBB), 500 ether);
    }
}
