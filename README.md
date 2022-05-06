# Solidity Benchmarks

Benchmarks for popular implementations of contract standards.

> ⚠️ The gas usage shown in the benchmarks doesn't take into account the 21k gas added to every ethereum transaction

- [ERC20 0.8.10](benchmarks/0.8.10/ERC20.md)
- [ERC721 0.8.10](benchmarks/0.8.10/ERC721.md)
- [ERC1155 0.8.10 (wip)](benchmarks/0.8.10/ERC1155.md)

You can see benchmarks for different compiler versions on [`benchmarks/`](benchmarks)

## Method used

We create a minimal implementation of each contract that uses the specific implementation as a base. Then for each of the methods we want to benchmark, we create a test contract that set the environment in the `setUp` function and each test only runs the specific function we're benchmarking, trying to reduce the noise as much as possible.

The gas usage shown here is not 100% accurate, but it's good enough to be able to compare the gas usage between the implementations.

All tests are generated using the template files in [`templates`](templates)

All tables in the readmes are generated using the scripts in [`scripts`](scripts)


## Contributing

If you want to add another implementation, please open an issue with a link to the repo, or try adding it yourself by using the instructions below.

### How to add a contract

**Dependencies**

- You'll need python 3 installed to run the scripts under the `scripts` folder
- `pip install -r requirements.txt` (or `pip3` depending on ur environment)

**Instructions**

1. Create a minimal implementation on `src/`, the contract name and file name should follow the convention `<Contract Type>_<Variation>`.
2. Implement the common interface that is in other files of the same contract type (for ERC721 for example, it's `mint` and `safeMint` functions)
3. Add an entry to the `contracts.<contract type>.variations` property on [test-cases.yml](test-cases.yml), following the examples there.
4. Add an entry to [scripts/<contract type>.py](scripts)'s `variants` var following the examples there. It should map the variant name you used in the contract like `ERC721_<Variant>` to the name you want to appear on the table. E.g.:

```python
variations = {
    "OZ": "Open Zeppelin",
    "OZEnumerable": "Open Zeppelin Enumerable",
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

**Benchmarks using solidity 0.8.10**

* [ERC20](benchmarks/0.8.10/ERC20.md)
* [ERC721](benchmarks/0.8.10/ERC721.md)
* [ERC1155](benchmarks/0.8.10/ERC1155.md)

**Benchmarks using solidity 0.8.11**

* [ERC20](benchmarks/0.8.11/ERC20.md)
* [ERC721](benchmarks/0.8.11/ERC721.md)
* [ERC1155](benchmarks/0.8.11/ERC1155.md)

**Benchmarks using solidity 0.8.12**

* [ERC20](benchmarks/0.8.12/ERC20.md)
* [ERC721](benchmarks/0.8.12/ERC721.md)
* [ERC1155](benchmarks/0.8.12/ERC1155.md)

**Benchmarks using solidity 0.8.13**

* [ERC20](benchmarks/0.8.13/ERC20.md)
* [ERC721](benchmarks/0.8.13/ERC721.md)
* [ERC1155](benchmarks/0.8.13/ERC1155.md)