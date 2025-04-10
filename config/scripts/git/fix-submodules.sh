#❯git submodule update --init
# fatal: No url found for submodule path 'bats-test/test_helper/bats-support' in .gitmodules
#❯git rm --cached bats-test/test_helper/bats-support
# rm 'bats-test/test_helper/bats-support'

git submodule update --init --recursive
git rm --cached '<submodule_path>'