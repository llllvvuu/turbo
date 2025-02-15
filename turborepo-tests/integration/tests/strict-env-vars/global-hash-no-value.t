Setup
  $ . ${TESTDIR}/../../../helpers/setup_integration_test.sh strict_env_vars

With --env-mode (should be the same as --env-mode=infer)

Baseline global hash
  $ BASELINE=$(${TURBO} build -vv 2>&1 | "$TESTDIR/../_helpers/get-global-hash.sh")

There's no config to start, so the global hash does not change when flag is passed
  $ WITH_FLAG=$(${TURBO} build -vv --env-mode 2>&1 | "$TESTDIR/../_helpers/get-global-hash.sh")
  $ test $BASELINE = $WITH_FLAG

Add empty config for global pass through env var, global hash changes
  $ ${TESTDIR}/../../../helpers/replace_turbo_config.sh $(pwd) "strict_env_vars/global_pt-empty.json"
  $ WITH_EMPTY_GLOBAL=$(${TURBO} build -vv --env-mode 2>&1 | "$TESTDIR/../_helpers/get-global-hash.sh")
  $ test $BASELINE != $WITH_EMPTY_GLOBAL

Add global pass through env var, global hash changes again, because we changed the value
  $ ${TESTDIR}/../../../helpers/replace_turbo_config.sh $(pwd) "strict_env_vars/global_pt.json"
  $ WITH_GLOBAL=$(${TURBO} build -vv --env-mode 2>&1 | "$TESTDIR/../_helpers/get-global-hash.sh")
  $ test $WITH_EMPTY_GLOBAL != $WITH_GLOBAL
