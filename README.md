# Solidity Benchmarks

Benchmarks for popular implementations of contract standards.

> ⚠️ The gas usage shown in the benchmarks doesn't take into account the 21k gas added to every ethereum transaction

- [ERC20 0.8.23](benchmarks/0.8.23/ERC20.md)
- [ERC721 0.8.23](benchmarks/0.8.23/ERC721.md)
- [ERC1155 0.8.23](benchmarks/0.8.23/ERC1155.md)

You can see benchmarks for different compiler versions on [`benchmarks/`](benchmarks)

The file [`data.json`](data.json) provides a json format of all the data used in the benchmarks. That file is generated by running the command `make json`.

## Method used

We create a minimal implementation of each contract that uses the specific implementation as a base. Then for each of the methods we want to benchmark, we create a test contract that set the environment in the `setUp` function and each test only runs the specific function we're benchmarking, trying to reduce the noise as much as possible.

The gas usage shown here is not 100% accurate, but it's good enough to be able to compare the gas usage between the implementations.

All tests are generated using the template files in [`templates`](templates)

All tables in the readmes are generated using the scripts in [`scripts`](scripts)

## Contributing

There are many ways to contribute to this project

- Add a snapshot for the latest solc version
- Add or suggest a contract implementation (the instructions for adding are below)
- Update a contract implementation
- Enhance the codegen scripts

### Setup for local development

- Install foundry http://getfoundry.sh
- You'll need python 3 installed to run the scripts under the `scripts` folder
- Install the python dependencies `pip install -r requirements.txt`
- `git clone --recurse-submodules https://github.com/alephao/solidity-benchmarks.git`

### How to add a contract

1. Create a minimal implementation on `src/`, the contract name and file name should follow the convention `<Contract Type>_<Variation>`.
2. Implement the common interface that is in other files of the same contract type (for ERC721 for example, it's `mint` and `safeMint` functions)
3. Add an entry to the `contracts.<contract type>.variations` property on [test-cases.yml](test-cases.yml), following the examples there.
4. Add an entry to [scripts/<contract type>.py](scripts)'s `variants` var following the examples there. It should map the variant name you used in the contract like `ERC721_<Variant>` to the name you want to appear on the table. E.g.:
5. In case you added an ERC721 that's also ERC2309 compliant, add a another contract in the same file following the convention `<Contract Type>_<Variation>_ERC2309`, and add an entry to the `contracts.ERC721.ERC2309Variations` in the [test-cases.yml](test-cases.yml)

```python
variations = {
    "OZ": "OpenZeppelin",
    "OZEnumerable": "OpenZeppelin Enumerable",
    "OZConsecutive": "OpenZeppelin Consecutive",
    "Solady": "Solady",
    "Solmate": "Solmate",
    "A": "ERC721A",
    "B": "ERC721B",
    "K": "ERC721K",
}
```


5. Run the following commands:

```console
make codegen
make snapshot
make readme
```


6. Add the contract to the list at the top of the `<Contract Type>.md`. (If you added a new ERC721, update the list on top of [`ERC721.md`](ERC721.md))

### Quick links

**ERC20**

* [0.8.20](benchmarks/0.8.20/ERC20.md) or [0.8.20-ir](benchmarks/0.8.20-via-ir/ERC20.md)
* [0.8.21](benchmarks/0.8.21/ERC21.md) or [0.8.21-ir](benchmarks/0.8.21-via-ir/ERC20.md)
* [0.8.22](benchmarks/0.8.22/ERC22.md) or [0.8.22-ir](benchmarks/0.8.22-via-ir/ERC20.md)
* [0.8.23](benchmarks/0.8.23/ERC23.md) or [0.8.23-ir](benchmarks/0.8.23-via-ir/ERC20.md)


**ERC721**

* [0.8.20](benchmarks/0.8.20/ERC721.md) or [0.8.20-ir](benchmarks/0.8.20-via-ir/ERC721.md)
* [0.8.21](benchmarks/0.8.21/ERC721.md) or [0.8.21-ir](benchmarks/0.8.21-via-ir/ERC721.md)
* [0.8.22](benchmarks/0.8.22/ERC721.md) or [0.8.22-ir](benchmarks/0.8.22-via-ir/ERC721.md)
* [0.8.23](benchmarks/0.8.23/ERC721.md) or [0.8.23-ir](benchmarks/0.8.23-via-ir/ERC721.md)


**ERC1155**

* [0.8.20](benchmarks/0.8.20/ERC1155.md) or [0.8.20-ir](benchmarks/0.8.20-via-ir/ERC1155.md)
* [0.8.21](benchmarks/0.8.21/ERC1155.md) or [0.8.21-ir](benchmarks/0.8.21-via-ir/ERC1155.md)
* [0.8.22](benchmarks/0.8.22/ERC1155.md) or [0.8.22-ir](benchmarks/0.8.22-via-ir/ERC1155.md)
* [0.8.23](benchmarks/0.8.23/ERC1155.md) or [0.8.23-ir](benchmarks/0.8.23-via-ir/ERC1155.md)

