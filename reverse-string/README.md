# Reverse String

Reverse a string

For example:
input: "cool"
output: "looc"


## Run the tests with `bats`

```bash
bats reverse_string_test.sh
```

After the first test(s) pass, continue by commenting out or removing the
`[[ $BATS_RUN_SKIPPED == true ]] || skip`
annotations prepending other tests.

To run all tests, including the ones with `skip` annotations, run:

```bash
BATS_RUN_SKIPPED=true bats reverse_string_test.sh
```
## Reference

* `rev`
* command line arguments
