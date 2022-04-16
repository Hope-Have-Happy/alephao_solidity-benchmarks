// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.4;

import {DSTest} from "@ds-test/test.sol";
import {Vm} from "@forge-std/Vm.sol";
{% for variation in contracts.erc721.variations %}
import {ERC721_{{variation}}} from "$/ERC721_{{variation}}.sol";
{% endfor %}

{% for variation in contracts.erc721.variations %}
// mint
contract ERC721_{{variation}}_mint_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_{{variation}} internal sut;

    function setUp() public {
        sut = new ERC721_{{variation}}();
    }
    {% for mintAmount in contracts.erc721.methods.mint %}

    function test_mint_{{mintAmount}}() public {
        sut.mint(address(0xAAAA), {{mintAmount}});
    }
    {% endfor %}
}

// safeMint
contract ERC721_{{variation}}_safeMint_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_{{variation}} internal sut;

    function setUp() public {
        sut = new ERC721_{{variation}}();
    }
    {% for mintAmount in contracts.erc721.methods.mint %}

    function test_safeMint_{{mintAmount}}() public {
        sut.safeMint(address(0xAAAA), {{mintAmount}});
    }
    {% endfor %}
}

// transfer toOwner
contract ERC721_{{variation}}_transferToOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_{{variation}} internal sut;

    function setUp() public {
        sut = new ERC721_{{variation}}();
        sut.mint(address(0xAAAA), 101);
        sut.mint(address(0xBBBB), 101);
    }
    {% for tokenId in contracts.erc721.methods.transfer %}

    function test_transferToOwner_id{{tokenId}}() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xBBBB), {{tokenId}});
    }
    {% endfor %}
}

contract ERC721_{{variation}}_transferToNonOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_{{variation}} internal sut;

    function setUp() public {
        sut = new ERC721_{{variation}}();
        sut.mint(address(0xAAAA), 101);
    }
    {% for tokenId in contracts.erc721.methods.transfer %}

    function test_transferToNonOwner_id{{tokenId}}() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), {{tokenId}});
    }
    {% endfor %}
}

// setApprovalForAll
contract ERC721_{{variation}}_setApprovalForAll_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_{{variation}} internal sut;

    function setUp() public {
        sut = new ERC721_{{variation}}();
        sut.mint(address(0xAAAA), 101);
    }

    function test_setApprovalForAll() public {
        HEVM.prank(address(0xAAAA));
        sut.setApprovalForAll(address(0xCCCC), true);
    }
}

// approve
contract ERC721_{{variation}}_approve_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_{{variation}} internal sut;

    function setUp() public {
        sut = new ERC721_{{variation}}();
        sut.mint(address(0xAAAA), 101);
    }

    {% for tokenId in contracts.erc721.methods.approve %}

    function test_approve_id{{tokenId}}() public {
        HEVM.prank(address(0xAAAA));
        sut.approve(address(0xCCCC), {{tokenId}});
    }
    {% endfor %}
}

{% endfor %}
