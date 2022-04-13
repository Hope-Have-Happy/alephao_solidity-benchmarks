// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import {DSTest} from "@ds-test/test.sol";
import {Vm} from "@forge-std/Vm.sol";
{% for contract in contracts %}
import { {{contract.name}} } from "$/{{contract.name}}.sol";
{% endfor %}

{% for contract in contracts %}
contract {{contract.type}}MintTest is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    {{contract.name}} internal sut;

    function setUp() public {
        sut = new {{contract.name}}();
    }

    {% for testMintAmount in tests.mint %}
    function test_mint_{{testMintAmount}}() public {
        sut.mint(address(0xAAAA), {{testMintAmount}});
    }
    {% endfor %}
}

contract {{contract.type}}TransferTest is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    {{contract.name}} internal sut;

    function setUp() public {
        sut = new {{contract.name}}();
        sut.mint(address(0xAAAA), 100);
        sut.mint(address(0xBBBB), 100);
    }

    function test_transfer_toOwner() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xBBBB), 50);
    }

    function test_transfer_toNonOwner() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), 50);
    }
}

{% endfor %}
