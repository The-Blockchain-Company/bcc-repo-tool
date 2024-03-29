# bcc-repo-tool

A simple command line tool to help manage the `stack.yaml` and `cabal.project` files of
the various Bcc git repos.

To use it, simply clone the repo, build the tool (with either `stack` or `cabal`) and copy
it to somewhere on your `$PATH`.

The tool run without any commands or parameters will do nothing more than print a help
message:
```
bcc-repo-tool - A tool for managing the Bcc repos.

Usage: bcc-repo-tool [-v|--version] COMMAND

Available options:
  -h,--help                Show this help text
  -v,--version             Print the version and exit

Available commands:
  clone-repos              Clone any missing repos into the current directory.
  print-hashes             Print the git hashes for the relevant repos.
  list-repos               List the repos expected by this tool.
  repo-status              List the statuses of each repo.
  reset-changes            Reset any changes to the cabal.project and stack.yaml
                           files.
  update-cabal-project     Update git hashes in cabal.project file (in the
                           current directory) from the stack.yaml file.
  update-hash              Get the latest git hashes, and update the stack.yaml
                           and cabal.project file for the specified repo.
  update-hashes            Get the latest git hashes, and update all stack.yaml
                           and cabal.project files.
  update-repo              Update a single repo ('git checkout master && git
                           pull --rebase').
  update-repos             Update all repos ('git checkout master && git pull
                           --rebase').
```

## Usage

This tool assumes that a git checkout of all the relevant repositories exists in the current
working directory (and ignores any unrelated directories).

* A list of the relevant repos can be obtained using the command:
  ```
  bcc-repo-tool list-repos
  ```

* Cloning a copy of any missing (or possibly all) repositories can be done using:
  ```
  bcc-repo-tool clone-repos
  ```

* Updating (checking out the `master` branch and doing a `git pull --rebase`) the relevant repos
  can be done with:
  ```
  bcc-repo-tool update-repos
  ```
  This operation may fail if any of the repos currently have uncommitted changes.

* Once all the relevant repos have been updated, the git hashes in the `stack.yaml` and
  `cabal.project` files can be done with the command:
  ```
  bcc-repo-tool update-hashes
  ```
  This command prints out which files have been updated. Each repo that has been updated then
  needs the changes to the `stack.yaml` and `cabal.project` files to be committed, the building
  of each project tested and a PR raised.
